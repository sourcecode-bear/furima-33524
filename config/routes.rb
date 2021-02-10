Rails.application.routes.draw do
  root to: 'products#index'
  devise_for :users
  #patch  '/users/:id',      to: 'users#update'
  resources :products, only: [:index, :new, :create, :show, :edit, :update]
end
