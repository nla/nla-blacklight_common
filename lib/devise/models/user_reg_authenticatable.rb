# frozen_string_literal: true

require_relative "../strategies/user_reg_authenticatable"

require "ostruct"
require "faraday"
require "faraday/middleware"
require "faraday/adapter/net_http"

module Devise
  module Models
    module UserRegAuthenticatable
      extend ActiveSupport::Concern

      def required_fields(*)
        [:username, :password]
      end

      def active_for_authentication?
        super && self[:active]
      end

      def inactive_message
        (!self[:active]) ? :expired : super
      end

      def authenticatable_salt
        # Make the Keycloak session ID part of the authentication salt.
        # See https://makandracards.com/makandra/53562-devise-invalidating-all-sessions-for-a-user
        "#{super}#{self[:session_token]}"
      end

      def after_user_reg_authentication
        # TODO maybe fetch things from FOLIO and setup session variables?

        # We don't really care about the password since auth is via Get a Library Card,
        # so we're just putting a dummy value here.
        self[:encrypted_password] = Devise::Encryptor.digest(self.class, Devise.friendly_token(20))
        save!
      end

      protected

      # Hashes the password using bcrypt. Custom hash functions should override
      # this method to apply their own algorithm.
      #
      # See https://github.com/heartcombo/devise-encryptable for examples
      # of other hashing engines.
      def password_digest(password)
        Devise::Encryptor.digest(self.class, password)
      end

      module ClassMethods
        Devise::Models.config(self, :pepper, :stretches)

        def find_for_user_reg_authentication(conditions)
          request_body = JSON.generate(barcode: conditions[:username], lastName: conditions[:password])
          response = Faraday.new(url: ENV["PATRON_AUTH_URL"])
            .post(ENV["PATRON_AUTH_ENDPOINT"], request_body.to_s, "Content-Type" => "application/json")

          if response.present? && response.status == 200
            auth_response = JSON.parse(response.body, object_class: OpenStruct)

            user = find_for_authentication({folio_id: auth_response[:id]})
            authenticated_user = user.presence || User.create!({
              folio_id: auth_response[:id]
            })

            authenticated_user[:name_family] = auth_response[:lastName]
            authenticated_user[:name_given] = auth_response[:firstName]
            authenticated_user[:active] = ActiveRecord::Type::Boolean.new.cast(auth_response[:active])
            authenticated_user.save!
            authenticated_user
          end
        end
      end
    end
  end
end
