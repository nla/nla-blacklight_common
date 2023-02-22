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
require "bcrypt"

class User < PatronRecord
  # Connects this user object to Blacklights Bookmarks.
  include Blacklight::User

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :getalibrarycard_authenticatable, :timeoutable,
    :omniauthable, omniauth_providers: %i[staff_spl staff_sol staff_shared]

  attr_accessor :username, :password

  def self.from_keycloak(auth)
    find_or_create_by!(provider: auth.provider, uid: auth.uid) do |user|
      # We don't really care about the password since auth is via Keycloak, so we're just
      # putting a dummy value here.
      user.encrypted_password = SecureRandom.hex(14)

      # staff shared accounts may not have an email, first name or last name
      user.email = auth.info.email.present? ? auth.info.email : ""
      user.name_given = auth.info.first_name
      user.name_family = auth.info.last_name
    end
  end

  # Method added by Blacklight; Blacklight uses #to_s on your
  # user class to get a user-displayable login/identifier for
  # the account.
  def to_s
    "#{name_given} #{name_family}"
  end
end
