Rails.application.routes.draw do
  mount Flipper::UI.app(Flipper) => "/feats", :constraints => StaffOnlyConstraint.new

  # for non-local Arclight deployment
  scope(path: "/finding-aids") do
    mount Flipper::UI.app(Flipper) => "/feats", :constraints => StaffOnlyConstraint.new
  end

  devise_for :users, controllers: {
    sessions: "users/sessions",
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  devise_scope(:user) do
    post "/backchannel_logout", to: "users/sessions#backchannel_logout", as: :backchannel_logout
  end

  get "account", to: "accounts#show", as: :account
end
