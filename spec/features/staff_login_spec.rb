# frozen_string_literal: true

require "rails_helper"

module ApplicationHelper
end

RSpec.describe "Staff login" do
  it "does not display outside staff network" do
    visit root_path
    click_link "Login"
    expect(page).to have_content("Log in")

    expect(page).not_to have_content(I18n.t("auth.staff.login_button_text"))
  end
end
