Rails.application.routes.draw do
  devise_for :users

  resources :group do
    resources :users_groups
  end

  resources :categories do
    resources :group do
      resources :posts do
        resources :comments
      end
    end
  end
  get "users/check_signed_in"
  post "users/api_sign_in"
  delete "users/api_sign_out"

  # additional
  post "users/register"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
