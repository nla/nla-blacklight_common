# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Accounts" do
  context "when not logged in" do
    describe "GET /account" do
      it "redirects to login" do
        get account_path
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  context "when logged in" do
    describe "GET /account" do
      it "returns http success" do
        sign_in create(:user)
        get account_path
        expect(response).to have_http_status(:success)
      end

      it "displays the user's name" do
        sign_in create(:user)
        get account_path
        expect(response.body).to include("Test User")
      end
    end
  end
end
