# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Login" do
  before do
    # rubocop:disable RSpec/AnyInstance
    allow_any_instance_of(PatronHelper).to receive(:user_location).and_return(:offsite)
    allow(ENV).to receive(:[]).and_call_original
    allow(ENV).to receive(:[]).with("KC_PATRON_REALM").and_return("patron_realm")
    # rubocop:enable RSpec/AnyInstance
  end

  it "displays a login link" do
    visit root_path

    expect(page).to have_link("Login", href: new_user_session_path)
  end

  it "displays the patron login button" do
    visit root_path
    click_link "Login"
    expect(page).to have_content(I18n.t("auth.patron.login_text"))
    expect(page).to have_content(I18n.t("auth.patron.login_btn"))
  end

  it "displays the upgrade link" do
    visit root_path
    click_link "Login"
    expect(page).to have_content(I18n.t("auth.patron.upgrade_text"))
    expect(page).to have_content(I18n.t("auth.patron.upgrade_btn"))
  end
end
