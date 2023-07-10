Rails.application.routes.draw do
  devise_scope(:user) do
    get "pages/home"
    get "account", to: "accounts#show", as: :account
  end

  get "about", to: "pages#about"

  root "pages#home"
end
