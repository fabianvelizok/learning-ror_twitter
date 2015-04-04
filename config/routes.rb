Rails.application.routes.draw do
  devise_for :users

  resources :tweets, only: [:new, :create, :show] do
    get 'likes', on: :member
  end

  resources :followings, only: [:create, :destroy], param: :slug
  resources :likes, only: [:create, :destroy]

  get ':slug',           to: 'users#profile',     as: 'user_profile'
  get ':slug/followed',  to: 'users#followed',    as: 'followed_users'
  get ':slug/followers', to: 'users#followers',   as: 'followers_users'
  get 'users/all',       to: 'users#index',       as: 'users'

  root 'home#index'

end
