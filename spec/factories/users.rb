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

require "securerandom"

FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "test-#{n.to_s.rjust(3, "0")}@example.com" }
    password { "123456" }
    folio_id { SecureRandom.uuid }
    name_given { "Test" }
    name_family { "User" }

    trait :staff do
      provider { "catalogue_sol" }
      uid { "603e26dd-b2d4-4a88-ad9d-406eaec31463" }
      name_given { "Staff" }
      name_family { "User" }
      email { "staff@nla.gov.au" }
      session_token { SecureRandom.hex }
    end

    created_at { Time.current }
    updated_at { Time.current }
  end
end
