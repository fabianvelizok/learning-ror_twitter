Rails.application.routes.draw do

  devise_for :users

  resources :tweets, only: [:new, :create, :show]

  root 'home#index'
  
end
