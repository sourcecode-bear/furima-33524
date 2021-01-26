Rails.application.routes.draw do
  root to:'controller#index'
  devise_for :users
end
