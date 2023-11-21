# frozen_string_literal: true

require "rails_helper"

RSpec.shared_context "with active session" do
  let(:file) { IO.read("spec/files/auth/staff_auth_hash.json") }
  let(:auth_hash) { OmniAuth::AuthHash.new(JSON.parse(file)) }
  let(:id_token) { auth_hash.extra.id_token }
  let(:iss) { auth_hash.extra.raw_info.iss }
  let(:session) do
    {iss: iss, id_token: id_token}
  end

  before do
    patron = create(:user, :staff)
    sign_in patron

    # rubocop:disable RSpec/AnyInstance
    allow_any_instance_of(::Users::SessionsController).to receive(:session).and_return(session)
    # rubocop:enable RSpec/AnyInstance
  end
end

RSpec.shared_examples "logged out" do |action: :delete, path: "destroy_user_session_path"|
  it "logs out the user" do
    process(action, send(path))
    expect(flash[:notice]).to eq I18n.t("devise.sessions.signed_out")
    expect(request).to redirect_to("#{iss}/protocol/openid-connect/logout?id_token_hint=#{id_token}&post_logout_redirect_uri=#{root_url}")
  end
end

RSpec.describe "Logout" do
  include Devise::Test::IntegrationHelpers

  include_context "with active session"

  it_behaves_like "logged out"

  context "when navigated to /logout" do
    it_behaves_like "logged out", action: :get, path: :logout_url
  end

  context "when Keycloak performs backchannel logout" do
    let(:logout_token) { IO.read("spec/files/auth/logout_token.txt") }
    let(:session_id) do
      jwt = JWT.decode(logout_token, nil, false)
      jwt[0]["sid"]
    end
    let(:patron) do
      user = create(:user, :staff)
      user.session_token = session_id
      user.save!
      user.reload
    end

    before do
      sign_in patron
    end

    it "updates the session_token for the logged out user" do
      post "/backchannel_logout", params: {logout_token: logout_token}
      patron.reload
      expect(patron.session_token).not_to eq session_id
    end
  end
end
