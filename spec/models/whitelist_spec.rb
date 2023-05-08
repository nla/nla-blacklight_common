# frozen_string_literal: true

require "rails_helper"

RSpec.describe Whitelist do
  describe "#location" do
    subject(:location) {
      described_class.instance.location(request)
    }

    let(:request) { ActionDispatch::TestRequest.create({"REMOTE_ADDR" => "127.0.0.1"}) }

    context "when in local subnet" do
      let(:request) { ActionDispatch::TestRequest.create({"REMOTE_ADDR" => "187.121.206.121,130.195.174.208"}) }

      it "returns :local" do
        expect(location).to eq :onsite
      end
    end

    context "when in staff subnet" do
      let(:request) { ActionDispatch::TestRequest.create({"REMOTE_ADDR" => "200.2.40.0"}) }

      it "returns :staff" do
        expect(location).to eq :staff
      end
    end

    context "when outside local and staff subnets" do
      it "returns :offsite" do
        expect(location).to eq :offsite
      end
    end
  end

  describe "#user_type" do
    subject(:user_type) {
      described_class.instance.user_type(request)
    }

    let(:request) { ActionDispatch::TestRequest.create({"REMOTE_ADDR" => "127.0.0.1"}) }

    context "when in local subnet" do
      let(:request) { ActionDispatch::TestRequest.create({"REMOTE_ADDR" => "187.121.206.121"}) }

      it "returns :local" do
        expect(user_type).to eq :local
      end
    end

    context "when in staff subnet" do
      let(:request) { ActionDispatch::TestRequest.create({"REMOTE_ADDR" => "200.2.40.0"}) }

      it "returns :staff" do
        expect(user_type).to eq :staff
      end
    end

    context "when outside local and staff subnets" do
      it "returns :offsite" do
        expect(user_type).to eq :external
      end
    end
  end
end
