# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Active link" do
  describe "#active_link_class_path" do
    it "returns active given a path" do
      visit root_path

      expect(page).to have_css("a.active", text: "Home")
    end
  end

  describe "#active_link_class_controller" do
    it "returns active given an array of controller names" do
      visit about_path

      expect(page).to have_css("a.active", text: "About")
    end
  end

  describe "#active_link_class" do
    it "returns active given the controller and action" do
      visit root_path
      click_link "Login"
      expect(page).to have_content("Login")

      fill_in "user_username", with: "bltest"
      fill_in "user_password", with: "test"
      click_button "Login"

      visit account_path

      expect(page).to have_css("a.active", text: "blacklight test")
    end
  end
end
