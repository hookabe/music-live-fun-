Rails.application.routes.draw do

  devise_for :users
  resources :users, only: [:show, :edit, :update]
  get 'users/:id/profile', to: 'users#show', as: 'user_profile'
  get 'pages/index'
  root to: 'pages#index'
end
