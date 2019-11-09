Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :edit, :update] do
    resources :avatars, only: [:create]
  end
  resources :events do
    resources :participations
  end
  namespace :admin do
    root 'admin#index'
    resources :users
  end
  root 'events#index'
end
