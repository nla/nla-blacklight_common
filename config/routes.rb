# == Route Map
#
#                                   Prefix Verb     URI Pattern                                     Controller#Action
#                               pages_home GET      /pages/home(.:format)                           pages#home
#                                  account GET      /account(.:format)                              accounts#show
#                                    about GET      /about(.:format)                                pages#about
#                                     root GET      /                                               pages#home
# user_catalogue_patron_omniauth_authorize GET|POST /users/auth/catalogue_patron(.:format)          users/omniauth_callbacks#passthru
#  user_catalogue_patron_omniauth_callback GET|POST /users/auth/catalogue_patron/callback(.:format) users/omniauth_callbacks#catalogue_patron
#    user_catalogue_sol_omniauth_authorize GET|POST /users/auth/catalogue_sol(.:format)             users/omniauth_callbacks#passthru
#     user_catalogue_sol_omniauth_callback GET|POST /users/auth/catalogue_sol/callback(.:format)    users/omniauth_callbacks#catalogue_sol
#    user_catalogue_spl_omniauth_authorize GET|POST /users/auth/catalogue_spl(.:format)             users/omniauth_callbacks#passthru
#     user_catalogue_spl_omniauth_callback GET|POST /users/auth/catalogue_spl/callback(.:format)    users/omniauth_callbacks#catalogue_spl
# user_catalogue_shared_omniauth_authorize GET|POST /users/auth/catalogue_shared(.:format)          users/omniauth_callbacks#passthru
#  user_catalogue_shared_omniauth_callback GET|POST /users/auth/catalogue_shared/callback(.:format) users/omniauth_callbacks#catalogue_shared
#                         new_user_session GET      /sign_in(.:format)                              users/sessions#new
#                     destroy_user_session DELETE   /sign_out(.:format)                             users/sessions#destroy
#                                   logout GET      /logout(.:format)                               users/sessions#destroy
#                  expired_keycloak_logout GET      /expired_keycloak_logout(.:format)              users/sessions#expired_keycloak_logout
#                       backchannel_logout POST     /backchannel_logout(.:format)                   users/sessions#backchannel_logout

Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: "users/sessions",
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  devise_scope(:user) do
    get "sign_in", to: "users/sessions#new", as: :new_user_session
    delete "sign_out", to: "users/sessions#destroy", as: :destroy_user_session
    get "logout", to: "users/sessions#destroy", as: :logout
    get "expired_keycloak_logout", to: "users/sessions#expired_keycloak_logout", as: :expired_keycloak_logout
    post "backchannel_logout", to: "users/sessions#backchannel_logout", as: :backchannel_logout
  end

  # scope path: "/email_2fa", as: "email_2fa" do
  #   get "/enable", to: "email2fa#enable_email_2fa", as: "enable"
  #   get "/disable", to: "email2fa#disable_email_2fa", as: "disable"
  #
  #   scope path: "/alert", as: "alert" do
  #     get "/", to: "email_2fa_alert#show"
  #     get "/dismiss", to: "email_2fa_alert#dismiss"
  #   end
  # end
end
