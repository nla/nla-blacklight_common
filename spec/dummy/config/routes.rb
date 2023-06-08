Rails.application.routes.draw do
  devise_scope(:user) do
    get "pages/home"
  end

  root "pages#home"
end
