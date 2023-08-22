# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                 :bigint           not null, primary key
#  active             :boolean          default("1"), not null
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
#  patron_id          :bigint
#  voyager_id         :bigint
#
# Indexes
#
#  index_users_on_folio_id  (folio_id) UNIQUE
#
require "bcrypt"

class User < PatronsRecord
  has_one :account, dependent: :destroy

  # Connects this user object to Blacklights Bookmarks.
  include Blacklight::User

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :user_reg_authenticatable, :timeoutable,
    :omniauthable, omniauth_providers: %i[catalogue_sol catalogue_spl catalogue_shared]

  attr_accessor :username, :password, :session_token

  # These are no longer used, but are from previous authentication with Get A Library Card.
  # Ignoring them now, for safe removal of the columns from the database in a later migration.
  self.ignored_columns = :patron_id, :voyager_id

  def self.from_keycloak(auth)
    ActiveRecord::Base.transaction do
      user = find_or_create_by!(folio_id: auth.extra.raw_info.folio_id) do |user|
        # We don't really care about the password since auth is via Keycloak, so we're just
        # putting a dummy value here.
        user.encrypted_password = SecureRandom.hex(14)
      end
      # set/update values from Keycloak in case they've changed
      user.email = auth.info.email.present? ? auth.info.email : ""
      user.provider = auth.provider
      user.uid = auth.uid
      user.name_given = auth.info.first_name
      user.name_family = auth.info.last_name
      user.active = if auth.extra.raw_info.folio_active.present?
        ActiveRecord::Type::Boolean.new.cast(auth.extra.raw_info.folio_active)
      else
        true # default to true
      end

      # this is required for backchannel logout
      user.session_token = auth.extra.raw_info.sid

      # reload user with updated values from database
      user.save!
      user.reload
    end
  end

  # Method added by Blacklight; Blacklight uses #to_s on your
  # user class to get a user-displayable login/identifier for
  # the account.
  def to_s
    name = "#{name_given} #{name_family}"
    if provider.present?
      name = if provider == "catalogue_sol"
        "#{name} (SOL)"
      elsif provider == "catalogue_spl"
        "#{name} (SPL)"
      elsif provider == "catalogue_shared"
        "#{name} (TOL)"
      end
    end
    name
  end
end
