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

  def self.from_keycloak(auth)
    user = find_or_create_by!(provider: auth.provider, uid: auth.uid) do |user|
      # We don't really care about the password since auth is via Keycloak, so we're just
      # putting a dummy value here.
      user.encrypted_password = SecureRandom.hex(14)

      user.email = auth.info.email.present? ? auth.info.email : ""
      user.name_given = auth.info.first_name
      user.name_family = auth.info.last_name

      # if this Keycloak user has a FOLIO ID, store it
      if auth.extra.raw_info.folio_id.present?
        user.folio_id = auth.extra.raw_info.folio_id
      end
    end
    # if the user was created before without storing the FOLIO ID, update it now
    if auth.extra.raw_info.folio_id.present? && user.folio_id.blank?
      user.update_column(:folio_id, auth.extra.raw_info.folio_id)
    end
    user.update_column(:session_token, auth.extra.raw_info.sid)
    user.reload
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
