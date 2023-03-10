# frozen_string_literal: true

require "rails_helper"

RSpec.describe PatronHelper do
  describe "#user_location" do
    subject(:location) { helper.user_location }

    context "when in local subnet" do
      before do
        request.env["REMOTE_ADDR"] = "187.121.206.121"
      end

      it "returns :onsite" do
        expect(location).to eq :onsite
      end
    end

    context "when in staff subnet" do
      before do
        request.env["REMOTE_ADDR"] = "200.2.40.0"
      end

      it "returns :staff" do
        expect(location).to eq :staff
      end
    end

    context "when offsite" do
      before do
        request.env["REMOTE_ADDR"] = "127.0.0.1"
      end

      it "returns :offsite" do
        expect(location).to eq :offsite
      end
    end
  end

  describe "#user_type" do
    subject(:user_type) { helper.user_type }

    context "when in local subnet" do
      before do
        request.env["REMOTE_ADDR"] = "187.121.206.121"
      end

      it "returns :local" do
        expect(user_type).to eq :local
      end
    end

    context "when in staff subnet" do
      before do
        request.env["REMOTE_ADDR"] = "200.2.40.0"
      end

      it "returns :staff" do
        expect(user_type).to eq :staff
      end
    end

    context "when offsite" do
      before do
        request.env["REMOTE_ADDR"] = "127.0.0.1"
      end

      it "returns :external" do
        expect(user_type).to eq :external
      end
    end
  end
end
