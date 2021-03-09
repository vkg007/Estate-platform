Rails.application.routes.draw do
  root 'main#index'
  get 'logout', to: 'sessions#destroy'
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create]
end

