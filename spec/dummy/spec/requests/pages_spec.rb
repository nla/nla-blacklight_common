require "rails_helper"

RSpec.describe "Pages" do
  describe "GET /home" do
    it "returns http success" do
      get "/pages/home"
      expect(response).to have_http_status(:success)
    end
  end
end
