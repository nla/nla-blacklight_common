# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]

  skip_before_action :verify_authenticity_token, only: [:backchannel_logout]

  def create
    super
  end

  def destroy
    if session[:iss].present?
      # Keycloak logout. Keycloak will send a POST to "/devise_logout" to perform a
      # backchannel logout that terminates the Devise session.
      keycloak_logout
    else
      # There is no Keycloak session identifier, so destroy the Devise session.
      devise_logout
    end
  end

  def backchannel_logout
    logout_token = params["logout_token"]
    jwt = JWT.decode(logout_token, nil, false)
    session_id = jwt[0]["sid"]

    # There is no user in context when this POST request from Keycloak is intercepted by Rails,
    # so we need to find the User with a matching Keycloak session in #session_token.
    user = User.find_by(session_token: session_id)
    user.update_column(:session_token, SecureRandom.hex)
  end

  protected

  def devise_logout
    signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
    set_flash_message! :notice, :signed_out if signed_out
    respond_to_on_destroy
  end

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
