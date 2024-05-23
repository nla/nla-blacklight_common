# frozen_string_literal: true

require "rails_helper"

RSpec.describe Email2faAlertComponent, type: :component do
  describe "when feature flag is not enabled" do
    it "does not render" do
      render_inline(described_class.new(false, "https://example.com/enable", "https://example.com/help", true))

      expect(page).to have_no_css("#email-2fa-alert")
    end
  end

  describe "when user has not enabled 2FA" do
    before do
      new_env = ENV.to_hash
      stub_const("ENV", new_env.merge("EMAIL_2FA_REGISTRATION_URL" => "https://dummy.com"))
    end

    context "when user has not dismissed the alert" do
      it "renders" do
        render_inline(described_class.new(false, "https://example.com/enable", "https://example.com/help", nil))

        expect(page).to have_css("#email-2fa-alert")
        expect(page).to have_link(I18n.t("account.settings.email_2fa.alert.enable_link_text"), href: "https://example.com/enable")
        expect(page).to have_link(I18n.t("account.settings.email_2fa.alert.help_link_text"), href: "https://example.com/help")
      end
    end

    context "when user has dismissed the alert" do
      it "does not render" do
        render_inline(described_class.new(false, "https://example.com/enable", "https://example.com/help", true))

        expect(page).to have_no_css("#email-2fa-alert")
      end
    end
  end

  describe "when user has enabled email 2FA" do
    it "does not render" do
      render_inline(described_class.new(true, "https://example.com/enable", "https://example.com/help", false))

      expect(page).to have_no_css("#email-2fa-alert")
    end
  end
end
