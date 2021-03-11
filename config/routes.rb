Rails.application.routes.draw do
  root 'main#index'
  get 'logout', to: 'sessions#destroy'
  resources :users, only: [:new, :create, :edit, :update]
  resources :sessions, only: [:new, :create]
end

