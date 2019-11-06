Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :edit, :update]
  resources :events do
    resources :participations
  end
  
  root 'events#index'
end
