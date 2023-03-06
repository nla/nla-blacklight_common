# frozen_state_literal: true

require "rails_helper"

RSpec.describe "Logout" do
  # rubocop:disable RSpec/AnyInstance
  before do
    allow_any_instance_of(ApplicationHelper).to receive(:in_staff_subnet?).and_return(false)
  end
  # rubocop:enable RSpec/AnyInstance

  it "destroys the user session" do
    visit new_user_session_path
    fill_in "user_username", with: "bltest"
    fill_in "user_password", with: "test"
    click_button "Log in"

    visit root_path
    click_link "Log Out"

    expect(page).to have_content(I18n.t("devise.sessions.signed_out"))
    expect(page).not_to have_content("blacklight test")
  end
end
