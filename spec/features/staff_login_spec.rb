# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Staff login" do
  context "when in public network" do
    # rubocop:disable RSpec/AnyInstance
    before do
      allow_any_instance_of(PatronHelper).to receive(:user_location).and_return(:offsite)
    end
    # rubocop:enable RSpec/AnyInstance

    it "display login links" do
      visit root_path
      click_link "Login"
      expect(page).to have_content("Login")

      expect(page).not_to have_content(I18n.t("auth.staff.sol_login"))
    end
  end

  context "when inside local network" do
    # rubocop:disable RSpec/AnyInstance
    before do
      allow_any_instance_of(PatronHelper).to receive(:user_location).and_return(:onsite)
    end
    # rubocop:enable RSpec/AnyInstance

    it "display login links" do
      visit root_path
      click_link "Login"
      expect(page).to have_content("Login")

      expect(page).not_to have_content(I18n.t("auth.staff.sol_login"))
    end
  end

  context "when inside staff network" do
    # rubocop:disable RSpec/AnyInstance
    before do
      allow_any_instance_of(PatronHelper).to receive(:user_location).and_return(:staff)
    end
    # rubocop:enable RSpec/AnyInstance

    it "display login links" do
      visit root_path
      click_link "Login"
      expect(page).to have_content("Login")

      expect(page).to have_content(I18n.t("auth.staff.sol_login"))
    end
  end
end
