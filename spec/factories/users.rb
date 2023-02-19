# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                 :bigint           not null, primary key
#  email              :string(255)      default(""), not null
#  encrypted_password :string(255)      default(""), not null
#  name_family        :string(255)
#  name_given         :string(255)
#  provider           :string(255)
#  uid                :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  folio_ext_sys_id   :string(255)
#  folio_id           :string(255)
#  patron_id          :bigint
#  voyager_id         :bigint
#
# Indexes
#
#  index_users_on_folio_ext_sys_id  (folio_ext_sys_id) UNIQUE
#  index_users_on_folio_id          (folio_id) UNIQUE
#
FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "test-#{n.to_s.rjust(3, "0")}@example.com" }
    password { "123456" }
    patron_id { 1 }
    voyager_id { 1 }

    trait :staff do
      provider { "keycloakopenid" }
      uid { "603e26dd-b2d4-4a88-ad9d-406eaec31463" }
      patron_id { nil }
      voyager_id { nil }
      name_given { "Staff" }
      name_family { "User" }
      email { "staff@nla.gov.au" }
    end

    created_at { Time.current }
    updated_at { Time.current }
  end
end
