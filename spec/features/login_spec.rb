# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Login in" do
  before do
    # rubocop:disable RSpec/AnyInstance
    allow_any_instance_of(PatronHelper).to receive(:user_location).and_return(:offsite)
    # rubocop:enable RSpec/AnyInstance
  end

  it "creates a new session for the user" do
    visit root_path
    click_link "Login"
    expect(page).to have_content("Log in")

    fill_in "user_username", with: "bltest"
    fill_in "user_password", with: "test"
    click_button "Log in"

    expect(page).to have_content(I18n.t("devise.sessions.signed_in"))
    expect(page).to have_content("blacklight test")
  end

  context "when user is inactive" do
    it "displays an error message" do
      visit root_path
      click_link "Login"
      expect(page).to have_content("Log in")

      fill_in "user_username", with: "bltest"
      fill_in "user_password", with: "blacklight"
      click_button "Log in"

      expect(page).to have_content(I18n.t("devise.failure.expired"))
      expect(page).to have_content("Log in")
    end
  end

  context "when user has the wrong credentials" do
    it "displays an error message" do
      visit root_path
      click_link "Login"
      expect(page).to have_content("Log in")

      fill_in "user_username", with: "0000"
      fill_in "user_password", with: "failure"
      click_button "Log in"

      expect(page).to have_content(I18n.t("devise.failure.invalid"))
      expect(page).to have_content("Log in")
    end
  end
end
