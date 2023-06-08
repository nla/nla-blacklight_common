# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Staff logout" do
  include Devise::Test::IntegrationHelpers

  let(:file) { IO.read("spec/files/auth/staff_auth_hash.json") }
  let(:auth_hash) { OmniAuth::AuthHash.new(JSON.parse(file)) }

  before do
    staff = create(:user, :staff)
    sign_in staff
  end

  it "redirects to Keycloak's logout URL" do
    id_token = auth_hash.extra.id_token
    iss = auth_hash.extra.raw_info.iss

    session = {iss: iss, id_token: id_token}

    # rubocop:disable RSpec/AnyInstance
    allow_any_instance_of(::Users::SessionsController).to receive(:session).and_return(session)
    # rubocop:enable RSpec/AnyInstance

    delete destroy_user_session_path
    expect(flash[:notice]).to eq I18n.t("devise.sessions.signed_out")
    expect(request).to redirect_to("#{iss}/protocol/openid-connect/logout?id_token_hint=#{id_token}&post_logout_redirect_uri=#{root_url}")
  end

  context "when Keycloak performs backchannel logout" do
    let(:logout_token) { IO.read("spec/files/auth/logout_token.txt") }
    let(:session_id) do
      jwt = JWT.decode(logout_token, nil, false)
      jwt[0]["sid"]
    end
    let(:staff) do
      user = create(:user, :staff)
      user.update_column(:session_token, session_id)
      user.reload
    end

    before do
      sign_in staff
    end

    it "updates the session_token for the logged out user" do
      post "/backchannel_logout", params: {logout_token: logout_token}
      expect(staff.session_token).not_to eq session_id
    end
  end
end
