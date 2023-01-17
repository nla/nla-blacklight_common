# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "test-#{n.to_s.rjust(3, "0")}@example.com" }
    password { "123456" }
    patron_id { 1 }
    voyager_id { 1 }

    trait :staff do
      provider { "keycloakopenid" }
      uid { "603e26dd-b2d4-4a88-ad9d-406eaec31463" }
      name_given { "Staff" }
      name_family { "User" }
      email { "staff@nla.gov.au" }
    end

    created_at { Time.current }
    updated_at { Time.current }
  end
end
