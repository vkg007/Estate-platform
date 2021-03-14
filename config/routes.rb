Rails.application.routes.draw do
  root 'main#index'
  get 'logout', to: 'sessions#destroy'
  resources :users, only: %i[new create edit update]
  resources :sessions, only: %i[new create]
end
