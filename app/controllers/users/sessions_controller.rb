# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]

  skip_before_action :verify_authenticity_token, only: [:backchannel_logout]

  def create
    super
  end

  def destroy
    if session[:iss].present?
      # After Keycloak logout, Keycloak will send a POST to "/backchannel_logout" to
      # randomly set the session_token to a new value.
      keycloak_logout
    else
      # There is no Keycloak session identifier, so destroy the Devise session.
      # TODO: remove when patron auth migrates to Keycloak.
      # :nocov:
      devise_logout
      # :nocov:
    end
  end

  def backchannel_logout
    logout_token = params["logout_token"]
    jwt = JWT.decode(logout_token, nil, false)
    session_id = jwt[0]["sid"]

    # There is no user in context when this POST request from Keycloak is intercepted by Rails,
    # so we need to find the User with a matching Keycloak session in #session_token.
    if session_id.present?
      user = User.find_by(session_token: session_id)
      if user.present?
        user.session_token = SecureRandom.hex
        user.save!
        user.reload
      else
        Rails.logger.error "Keycloak backchannel logout: failed to terminate session #{session_id}"
      end
    else
      sub = jwt[0]["sub"]
      Rails.logger.error "Keycloak backchannel logout: no session ID in logout token for #{sub}"
    end
  end

  protected

  # :nocov:
  def devise_logout
    signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
    set_flash_message! :notice, :signed_out if signed_out
    respond_to_on_destroy
  end
  # :nocov:

  def keycloak_logout
    iss = session[:iss]
    id_token = session[:id_token]

    signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
    set_flash_message! :notice, :signed_out if signed_out
    redirect_to("#{iss}/protocol/openid-connect/logout?id_token_hint=#{id_token}&post_logout_redirect_uri=#{root_url}", allow_other_host: true)
  end

  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [user: [:username, :password]])
  end
end
