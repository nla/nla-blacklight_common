Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: "users/sessions",
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  devise_scope(:user) do
    post "/backchannel_logout", to: "users/sessions#devise_logout", as: :backchannel_logout
  end
end
