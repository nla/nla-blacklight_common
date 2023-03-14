# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Authentication flag" do
  context "when authentication feature is enabled" do
    it "displays login link" do
      visit root_path

      expect(page).to have_content("Login")
      expect(page).to have_link("Login")
    end
  end

  context "when authentication feature is disabled" do
    before do
      Flipper.disable(:authentication)
    end

    it "does not display login link" do
      visit root_path

      expect(page).not_to have_content("Login")
    end

    context "when navigating directly to login" do
      it "redirects to the not found page" do
        visit new_user_session_path

        expect(page).to have_content("The page you were looking for doesn't exist.")
      end
    end
  end
end
