# frozen_state_literal: true

require "rails_helper"

RSpec.describe "Logout" do
  it "destroys the user session" do
    visit new_user_session_path
    fill_in "user_username", with: "bltest"
    fill_in "user_password", with: "test"
    click_button "Log in"

    visit root_path
    click_link "Log Out"

    expect(page).to have_content("Signed out successfully.")
    expect(page).not_to have_content("blacklight test")
  end
end
