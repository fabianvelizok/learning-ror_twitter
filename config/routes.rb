Rails.application.routes.draw do

  devise_for :users

  resources :tweets, only: [:new, :create, :show]

  get ':slug', to: 'users#profile', as: 'user_profile'

  root 'home#index'

end
