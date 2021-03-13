Rails.application.routes.draw do
  root 'main#index'
  get 'logout', to: 'sessions#destroy'
  get 'delete_property', to: 'properties#destroy'
  resources :sessions, only: %i[new create]
  resources :properties
  resources :users do
    get :properties
  end
end
