# frozen_string_literal: true

require "rails_helper"

RSpec.describe StaffOnlyConstraint do
  describe "#matches?" do
    subject(:match) { described_class.new.matches?(request) }

    context "when inside the staff subnet" do
      let(:request) { ActionDispatch::TestRequest.create({"REMOTE_ADDR" => "200.2.40.0"}) }

      it "returns true" do
        expect(match).to be true
      end
    end

    context "when outside the staff subnet" do
      let(:request) { ActionDispatch::TestRequest.create({"REMOTE_ADDR" => "127.0.0.1"}) }

      it "returns false" do
        expect(match).to be false
      end
    end
  end
end
