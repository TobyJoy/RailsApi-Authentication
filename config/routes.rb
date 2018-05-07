Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resource :sessions, only: [:create, :destroy]
  post "new_user_registration" => 'sessions#new_user_registration'
  post 'auth/request' => 'sessions#google_plus_authorization'
end
