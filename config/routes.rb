Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "orders#new"

  resources :users, only: [:show, :edit, :update, :index]
  resources :orders
  resources :cereals
  resources :drinks
  resources :soups

  namespace :api do
    resources :orders, only: [:index]
  end
end
