Rails.application.routes.draw do
  root 'main#index'
  get 'logout', to: 'sessions#destroy'
  resources :users
  resources :sessions
end

