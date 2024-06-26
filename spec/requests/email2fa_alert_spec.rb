require "rails_helper"

RSpec.describe "Email2faAlerts" do
  before do
    patron = create(:user)
    sign_in patron
  end

  describe "when feature flag is not enabled" do
    it "returns http success" do
      # rubocop:disable RSpec/VerifiedDoubles
      allow(Email2faService).to receive(:new).and_return(double(email_2fa_status: false))
      # rubocop:enable RSpec/VerifiedDoubles

      get email_2fa_alert_path

      expect(response).to have_http_status(:success)
      expect(response).to render_template(:show)
      expect(response.body).not_to include("Would you like to further secure your NLA user account with Two-factor Authentication (2FA)?")
    end
  end

  describe "GET /show" do
    before do
      new_env = ENV.to_hash
      stub_const("ENV", new_env.merge("EMAIL_2FA_REGISTRATION_URL" => "https://dummy.com"))
    end

    it "returns http success" do
      # rubocop:disable RSpec/VerifiedDoubles
      allow(Email2faService).to receive(:new).and_return(double(email_2fa_status: false))
      # rubocop:enable RSpec/VerifiedDoubles

      get email_2fa_alert_path

      expect(response).to have_http_status(:success)
      expect(response).to render_template(:show)
      expect(response.body).to include("Would you like to further secure your NLA user account with Two-factor Authentication (2FA)?")
    end

    context "when user is a staff member" do
      before do
        user = create(:user, :staff)
        sign_in user
      end

      it "does not display the alert" do
        # rubocop:disable RSpec/VerifiedDoubles
        allow(Email2faService).to receive(:new).and_return(double(email_2fa_status: false))
        # rubocop:enable RSpec/VerifiedDoubles

        get email_2fa_alert_path

        expect(response).to have_http_status(:success)
        expect(response).to render_template(:show)
        expect(response.body).not_to include("Would you like to further secure your NLA user account with Two-factor Authentication (2FA)?")
      end
    end
  end

  describe "GET /dismiss" do
    before do
      new_env = ENV.to_hash
      stub_const("ENV", new_env.merge("EMAIL_2FA_REGISTRATION_URL" => "https://dummy.com"))
    end

    it "returns http success" do
      get email_2fa_alert_dismiss_path

      expect(response).to have_http_status(:success)
      expect(response).to render_template(:show)
    end
  end
end
