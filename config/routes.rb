# == Route Map
#
#                                   Prefix Verb     URI Pattern                                                                                       Controller#Action
#                               pages_home GET      /pages/home(.:format)                                                                             pages#home
#                                  account GET      /account(.:format)                                                                                accounts#show
#                                    about GET      /about(.:format)                                                                                  pages#about
#                                     root GET      /                                                                                                 pages#home
# user_catalogue_patron_omniauth_authorize GET|POST /users/auth/catalogue_patron(.:format)                                                            users/omniauth_callbacks#passthru
#  user_catalogue_patron_omniauth_callback GET|POST /users/auth/catalogue_patron/callback(.:format)                                                   users/omniauth_callbacks#catalogue_patron
#    user_catalogue_sol_omniauth_authorize GET|POST /users/auth/catalogue_sol(.:format)                                                               users/omniauth_callbacks#passthru
#     user_catalogue_sol_omniauth_callback GET|POST /users/auth/catalogue_sol/callback(.:format)                                                      users/omniauth_callbacks#catalogue_sol
#    user_catalogue_spl_omniauth_authorize GET|POST /users/auth/catalogue_spl(.:format)                                                               users/omniauth_callbacks#passthru
#     user_catalogue_spl_omniauth_callback GET|POST /users/auth/catalogue_spl/callback(.:format)                                                      users/omniauth_callbacks#catalogue_spl
# user_catalogue_shared_omniauth_authorize GET|POST /users/auth/catalogue_shared(.:format)                                                            users/omniauth_callbacks#passthru
#  user_catalogue_shared_omniauth_callback GET|POST /users/auth/catalogue_shared/callback(.:format)                                                   users/omniauth_callbacks#catalogue_shared
#                         new_user_session GET      /sign_in(.:format)                                                                                users/sessions#new
#                     destroy_user_session DELETE   /sign_out(.:format)                                                                               users/sessions#destroy
#                  expired_keycloak_logout GET      /expired_keycloak_logout(.:format)                                                                users/sessions#expired_keycloak_logout
#                       backchannel_logout POST     /backchannel_logout(.:format)                                                                     users/sessions#backchannel_logout
#            rails_postmark_inbound_emails POST     /rails/action_mailbox/postmark/inbound_emails(.:format)                                           action_mailbox/ingresses/postmark/inbound_emails#create
#               rails_relay_inbound_emails POST     /rails/action_mailbox/relay/inbound_emails(.:format)                                              action_mailbox/ingresses/relay/inbound_emails#create
#            rails_sendgrid_inbound_emails POST     /rails/action_mailbox/sendgrid/inbound_emails(.:format)                                           action_mailbox/ingresses/sendgrid/inbound_emails#create
#      rails_mandrill_inbound_health_check GET      /rails/action_mailbox/mandrill/inbound_emails(.:format)                                           action_mailbox/ingresses/mandrill/inbound_emails#health_check
#            rails_mandrill_inbound_emails POST     /rails/action_mailbox/mandrill/inbound_emails(.:format)                                           action_mailbox/ingresses/mandrill/inbound_emails#create
#             rails_mailgun_inbound_emails POST     /rails/action_mailbox/mailgun/inbound_emails/mime(.:format)                                       action_mailbox/ingresses/mailgun/inbound_emails#create
#           rails_conductor_inbound_emails GET      /rails/conductor/action_mailbox/inbound_emails(.:format)                                          rails/conductor/action_mailbox/inbound_emails#index
#                                          POST     /rails/conductor/action_mailbox/inbound_emails(.:format)                                          rails/conductor/action_mailbox/inbound_emails#create
#        new_rails_conductor_inbound_email GET      /rails/conductor/action_mailbox/inbound_emails/new(.:format)                                      rails/conductor/action_mailbox/inbound_emails#new
#       edit_rails_conductor_inbound_email GET      /rails/conductor/action_mailbox/inbound_emails/:id/edit(.:format)                                 rails/conductor/action_mailbox/inbound_emails#edit
#            rails_conductor_inbound_email GET      /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                                      rails/conductor/action_mailbox/inbound_emails#show
#                                          PATCH    /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                                      rails/conductor/action_mailbox/inbound_emails#update
#                                          PUT      /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                                      rails/conductor/action_mailbox/inbound_emails#update
#                                          DELETE   /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                                      rails/conductor/action_mailbox/inbound_emails#destroy
# new_rails_conductor_inbound_email_source GET      /rails/conductor/action_mailbox/inbound_emails/sources/new(.:format)                              rails/conductor/action_mailbox/inbound_emails/sources#new
#    rails_conductor_inbound_email_sources POST     /rails/conductor/action_mailbox/inbound_emails/sources(.:format)                                  rails/conductor/action_mailbox/inbound_emails/sources#create
#    rails_conductor_inbound_email_reroute POST     /rails/conductor/action_mailbox/:inbound_email_id/reroute(.:format)                               rails/conductor/action_mailbox/reroutes#create
# rails_conductor_inbound_email_incinerate POST     /rails/conductor/action_mailbox/:inbound_email_id/incinerate(.:format)                            rails/conductor/action_mailbox/incinerates#create
#                       rails_service_blob GET      /rails/active_storage/blobs/redirect/:signed_id/*filename(.:format)                               active_storage/blobs/redirect#show
#                 rails_service_blob_proxy GET      /rails/active_storage/blobs/proxy/:signed_id/*filename(.:format)                                  active_storage/blobs/proxy#show
#                                          GET      /rails/active_storage/blobs/:signed_id/*filename(.:format)                                        active_storage/blobs/redirect#show
#                rails_blob_representation GET      /rails/active_storage/representations/redirect/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations/redirect#show
#          rails_blob_representation_proxy GET      /rails/active_storage/representations/proxy/:signed_blob_id/:variation_key/*filename(.:format)    active_storage/representations/proxy#show
#                                          GET      /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format)          active_storage/representations/redirect#show
#                       rails_disk_service GET      /rails/active_storage/disk/:encoded_key/*filename(.:format)                                       active_storage/disk#show
#                update_rails_disk_service PUT      /rails/active_storage/disk/:encoded_token(.:format)                                               active_storage/disk#update
#                     rails_direct_uploads POST     /rails/active_storage/direct_uploads(.:format)                                                    active_storage/direct_uploads#create

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
end
