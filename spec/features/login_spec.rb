# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Login" do
  before do
    # rubocop:disable RSpec/AnyInstance
    allow_any_instance_of(PatronHelper).to receive(:user_location).and_return(:offsite)
    # rubocop:enable RSpec/AnyInstance
  end

  context "when Keycloak patron authentication is enabled" do
    before do
      allow(ENV).to receive(:[]).and_call_original
      allow(ENV).to receive(:[]).with("KC_PATRON_REALM").and_return("patron_realm")
    end

    it "displays a login link" do
      visit root_path

      expect(page).to have_link("Login", href: new_user_session_path)
    end

    it "displays the patron login button" do
      visit root_path
      click_link "Login"
      expect(page).to have_content(I18n.t("auth.patron_login"))
    end
  end

  context "when Keycloak patron authentication is disabled" do
    it "creates a new session for the user" do
      visit root_path
      click_link "Login"
      expect(page).to have_content("Login")

      fill_in "user_username", with: "bltest"
      fill_in "user_password", with: "test"
      click_button "Login"

      expect(page).to have_content(I18n.t("devise.sessions.signed_in"))
      expect(page).to have_content("blacklight test")
    end

    it "displays a registration link" do
      visit new_user_session_path

      expect(page).to have_link("here", href: ENV["NATIONAL_LIBRARY_CARD_URL"])
    end

    it "disables Turbo" do
      visit new_user_session_path

      expect(page).to have_css("form[data-turbo]")
    end

    context "when user is inactive" do
      it "displays an error message" do
        visit root_path
        click_link "Login"
        expect(page).to have_content("Login")

        fill_in "user_username", with: "bltest"
        fill_in "user_password", with: "blacklight"
        click_button "Login"

        expect(page).to have_content(I18n.t("devise.failure.expired"))
        expect(page).to have_content("Login")
      end
    end

    context "when user has the wrong credentials" do
      it "displays an error message" do
        visit root_path
        click_link "Login"
        expect(page).to have_content("Login")

        fill_in "user_username", with: "0000"
        fill_in "user_password", with: "failure"
        click_button "Login"

        expect(page).to have_link("Ask a Librarian", href: ENV["ASK_LIBRARIAN_URL"])
        expect(page).to have_content("Login")
      end
    end

    context "when user does not enter a username or password" do
      it "displays an error message" do
        visit new_user_session_path
        click_button "Login"

        expect(page).to have_link("Ask a Librarian", href: ENV["ASK_LIBRARIAN_URL"])
      end
    end
  end
end
