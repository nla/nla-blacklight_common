require "nla/blacklight_common/routes/email2fa"

Rails.application.routes.draw do
  concern :email2fa, Nla::BlacklightCommon::Routes::Email2fa.new

  concerns :email2fa

  devise_scope(:user) do
    get "pages/home"
    get "account", to: "accounts#show", as: :account
  end

  get "about", to: "pages#about"

  root "pages#home"
end
