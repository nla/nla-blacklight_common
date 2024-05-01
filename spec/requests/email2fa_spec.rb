require "rails_helper"

RSpec.describe "Email2fa" do
  describe "GET /enable" do
    it "redirects to the email 2fa registration url" do
      allow(ENV).to receive(:[]).with("KEYCLOAK_URL").and_return("https://keycloak.example.com")
      allow(ENV).to receive(:[]).with("KC_PATRON_REALM").and_return("patron")
      allow(ENV).to receive(:[]).with("KC_PATRON_CLIENT").and_return("patron-client")
      allow(ENV).to receive(:[]).with("EMAIL_2FA_REGISTRATION_REDIRECT_URL").and_return("https://www.example.com")
      allow(ENV).to receive(:[]).with("EMAIL_2FA_ACTION").and_return("register")
      allow(ENV).to receive(:[]).with("EMAIL_2FA_REGISTRATION_URL").and_return("%s/auth/realms/%s/protocol/openid-connect/auth?response_type=code&client_id=%s&scope=openid&redirect_uri=%s&kc_action=%s")

      get email_2fa_enable_path

      expect(response).to redirect_to("https://keycloak.example.com/auth/realms/patron/protocol/openid-connect/auth?response_type=code&client_id=patron-client&scope=openid&redirect_uri=https://www.example.com&kc_action=register")
    end
  end

  describe "GET /disable" do
    before do
      patron = create(:user)
      sign_in patron
    end

    it "redirects back to the redirect url" do
      # rubocop:disable RSpec/VerifiedDoubles
      allow(Email2faService).to receive(:new).and_return(double(disable_email_2fa: nil, email_2fa_status: nil))
      # rubocop:enable RSpec/VerifiedDoubles
      allow(ENV).to receive(:[]).with("EMAIL_2FA_REGISTRATION_REDIRECT_URL").and_return("https://www.example.com")

      get email_2fa_disable_path

      expect(response).to redirect_to("https://www.example.com")
    end
  end
end
