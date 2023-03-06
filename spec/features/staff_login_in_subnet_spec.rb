# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Staff login in subnet" do
  # rubocop:disable RSpec/AnyInstance
  before do
    allow_any_instance_of(ApplicationHelper).to receive(:in_staff_subnet?).and_return(true)
  end
  # rubocop:enable RSpec/AnyInstance

  it "display login links inside network" do
    visit root_path
    click_link "Login"
    expect(page).to have_content("Log in")

    expect(page).to have_content(I18n.t("auth.staff.sol_login"))
  end
end
