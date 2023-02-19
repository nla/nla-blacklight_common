# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def staff_sol
    Rails.logger.debug(request.env["omniauth.auth"])
    @user = User.from_keycloak(request.env["omniauth.auth"])
    sign_in_and_redirect @user, event: :authentication
  end

  def staff_spl
    Rails.logger.debug(request.env["omniauth.auth"])
    @user = User.from_keycloak(request.env["omniauth.auth"])
    sign_in_and_redirect @user, event: :authentication
  end

  def staff_shared
    Rails.logger.debug(request.env["omniauth.auth"])
    @user = User.from_keycloak(request.env["omniauth.auth"])
    sign_in_and_redirect @user, event: :authentication
  end

  # Keycloak will display its own error page when there is a failure to login.
  # :nocov:
  def failure
    Rails.logger.error("Unable to authenticate user")
    redirect_to root_path
  end
  # :nocov:
end
