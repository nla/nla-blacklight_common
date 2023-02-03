# frozen_string_literal: true

require "bcrypt"

class User < PatronRecord
  # Connects this user object to Blacklights Bookmarks.
  include Blacklight::User

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :getalibrarycard_authenticatable, :timeoutable,
    :omniauthable, omniauth_providers: %i[staff_spl staff_sol]

  attr_accessor :username, :password

  def self.from_keycloak(auth)
    user = find_or_initialize_by(provider: auth.provider, uid: auth.uid)
    # We don't really care about the password since auth is via Get a Library Card or Keycloak,
    # so we're just putting a dummy value here.
    user.email = auth.info.email
    user.name_given = auth.info.first_name
    user.name_family = auth.info.last_name

    user.save
    user
  end

  # Method added by Blacklight; Blacklight uses #to_s on your
  # user class to get a user-displayable login/identifier for
  # the account.
  def to_s
    "#{name_given} #{name_family}"
  end
end
