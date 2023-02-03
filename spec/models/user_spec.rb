# frozen_string_literal: true

require "rails_helper"

RSpec.describe User do
  subject(:user) do
    create(:user,
      patron_id: 1,
      voyager_id: 1,
      name_given: "Blacklight",
      name_family: "Test")
  end

  describe "#to_s" do
    it "returns given and family name for the String value" do
      expect(user).not_to be_nil
      expect(user.to_s).to eq "Blacklight Test"
    end
  end

  describe "#from_omniauth" do
    subject(:kc_user) do
      create(:user, :staff)

      described_class.from_keycloak(auth_hash)
    end

    let(:file) { IO.read("spec/files/auth/auth_hash.json") }
    let(:auth_hash) { OmniAuth::AuthHash.new(JSON.parse(file)) }

    it "returns a User from Keycloak credentials" do
      expect(kc_user.patron_id).not_to be_nil
      expect(kc_user.voyager_id).not_to be_nil
      expect(kc_user.email).to eq "staff@nla.gov.au"
      expect(kc_user.name_given).to eq "Staff"
      expect(kc_user.name_family).to eq "User"
    end
  end
end
