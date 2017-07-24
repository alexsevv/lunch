Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "orders#index"

  resources :users
  resources :orders
  resources :cereals
  resources :drinks
  resources :soups
end
