# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                 :bigint           not null, primary key
#  active             :boolean          default(TRUE), not null
#  email              :string(255)      default(""), not null
#  encrypted_password :string(255)      default(""), not null
#  name_family        :string(255)
#  name_given         :string(255)
#  provider           :string(255)
#  session_token      :string(255)
#  uid                :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  folio_id           :string(255)
#
# Indexes
#
#  index_users_on_folio_id  (folio_id) UNIQUE
#
require "rails_helper"

RSpec.describe User do
  subject(:user) do
    create(:user,
      name_given: "Blacklight",
      name_family: "Test")
  end

  describe "#to_s" do
    it "returns given and family name for the String value" do
      expect(user).not_to be_nil
      expect(user.to_s).to eq "Blacklight Test"
    end
  end

  describe "#from_keycloak" do
    subject(:kc_user) do
      create(:user, :staff)

      described_class.from_keycloak(auth_hash)
    end

    let(:auth_hash) { OmniAuth::AuthHash.new(JSON.parse(file)) }

    context "when logging in as an SOL user", :altering_database do
      let(:file) { IO.read("spec/files/auth/catalogue_sol_auth_hash.json") }

      it "returns a User from Keycloak credentials" do
        expect(kc_user.email).to eq "ybattad@nla.gov.au"
        expect(kc_user.name_given).to eq "Yetrina"
        expect(kc_user.name_family).to eq "SOL"
        expect(kc_user.encrypted_password).not_to be_nil
        expect(kc_user.folio_id).to eq "folio_id"
      end

      it "indicates the type of account" do
        expect(kc_user).not_to be_nil
        expect(kc_user.to_s).to eq "Yetrina SOL (SOL)"
      end
    end

    context "when logging in as an SPL user", :altering_database do
      let(:file) { IO.read("spec/files/auth/catalogue_spl_auth_hash.json") }

      it "returns a User from Keycloak credentials" do
        expect(kc_user.email).to eq "ybattad@nla.gov.au"
        expect(kc_user.name_given).to eq "Yetrina"
        expect(kc_user.name_family).to eq "SPL"
        expect(kc_user.encrypted_password).not_to be_nil
        expect(kc_user.folio_id).to eq "folio_id"
        expect(kc_user.active).to be true
      end

      it "indicates the type of account" do
        expect(kc_user).not_to be_nil
        expect(kc_user.to_s).to eq "Yetrina SPL (SPL)"
      end
    end

    context "when logging in as a Shared user", :altering_database do
      let(:file) { IO.read("spec/files/auth/catalogue_shared_auth_hash.json") }

      it "returns a User from Keycloak credentials" do
        expect(kc_user.email).to eq "ybattad@nla.gov.au"
        expect(kc_user.name_given).to eq "Yetrina"
        expect(kc_user.name_family).to eq "Shared"
        expect(kc_user.encrypted_password).not_to be_nil
        expect(kc_user.folio_id).to eq "folio_id"
        expect(kc_user.active).to be true
      end

      it "indicates the type of account" do
        expect(kc_user).not_to be_nil
        expect(kc_user.to_s).to eq "Yetrina Shared (TOL)"
      end
    end

    context "when logging in as a Shared user with no email", :altering_database do
      let(:file) { IO.read("spec/files/auth/catalogue_shared_auth_hash_no_email.json") }

      it "sets email to an empty string" do
        expect(kc_user.email).to eq ""
      end
    end
  end
end
