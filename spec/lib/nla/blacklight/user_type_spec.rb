# frozen_string_literal: true

require "rails_helper"
require "nla/blacklight/user_type"

RSpec.describe Nla::Blacklight::UserType do
  subject(:user_type) {
    described_class.instance.type(request)
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
