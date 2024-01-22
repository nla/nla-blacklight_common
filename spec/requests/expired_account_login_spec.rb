# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Expired account login" do
  let(:file) { IO.read("spec/files/auth/auth_hash.json") }
  let(:auth_hash) { OmniAuth::AuthHash.new(JSON.parse(file)) }
  let(:patron) { create(:user, :inactive_patron) }

  context "when user logs in with expired account" do
    it "redirects to SessionsController#expired_keycloak_logout" do
      # rubocop:disable RSpec/AnyInstance
      allow_any_instance_of(UserService).to receive(:auto_renew).with(anything).and_return(false)
      # rubocop:enable RSpec/AnyInstance

      post "/users/auth/catalogue_patron"
      follow_redirect!

      expect(request).to redirect_to(expired_keycloak_logout_url)
    end
  end

  context "when redirected to SessionsController#expired_keycloak_logout" do
    it "logs out of Keycloak" do
      id_token = auth_hash.extra.id_token
      iss = auth_hash.extra.raw_info.iss

      session = {iss: iss, id_token: id_token}

      # rubocop:disable RSpec/AnyInstance
      allow_any_instance_of(::Users::SessionsController).to receive(:session).and_return(session)
      # rubocop:enable RSpec/AnyInstance

      get expired_keycloak_logout_url

      expect(flash[:notice]).to eq I18n.t("devise.failure.expired")
      expect(request).to redirect_to("#{iss}/protocol/openid-connect/logout?id_token_hint=#{id_token}&post_logout_redirect_uri=#{root_url}")
    end
  end
end
