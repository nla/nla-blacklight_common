# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def catalogue_sol
    Rails.logger.debug(request.env["omniauth.auth"])
    @user = User.from_keycloak(request.env["omniauth.auth"])
    store_keycloak_data(request.env["omniauth.auth"])
    sign_in_and_redirect @user, event: :authentication
  end

  def catalogue_spl
    Rails.logger.debug(request.env["omniauth.auth"])
    @user = User.from_keycloak(request.env["omniauth.auth"])
    store_keycloak_data(request.env["omniauth.auth"])
    sign_in_and_redirect @user, event: :authentication
  end

  def catalogue_shared
    Rails.logger.debug(request.env["omniauth.auth"])
    @user = User.from_keycloak(request.env["omniauth.auth"])
    store_keycloak_data(request.env["omniauth.auth"])
    sign_in_and_redirect @user, event: :authentication
  end

  # Keycloak will display its own error page when there is a failure to login.
  # :nocov:
  def failure
    Rails.logger.error("Unable to authenticate user")
    redirect_to root_path
  end
  # :nocov:

  private

  def store_keycloak_data(auth)
    # store the "id_token" for backchannel logout
    session[:id_token] = auth.extra.id_token
    session[:iss] = auth.extra.raw_info.iss
  end
end
