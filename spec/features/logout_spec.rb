# frozen_state_literal: true

require "rails_helper"

RSpec.describe "Logout" do
  before do
    # rubocop:disable RSpec/AnyInstance
    allow_any_instance_of(PatronHelper).to receive(:user_location).and_return(:offsite)
    # rubocop:enable RSpec/AnyInstance
  end

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
