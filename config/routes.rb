Rails.application.routes.draw do
  root 'main#index'
  get 'logout', to: 'sessions#destroy'
  post 'properties/search', to: 'properties#search', as: 'search_properties'
  resources :sessions, only: %i[new create]
  resources :users, only: %i[new create edit update] do
    resources :addresses, except: %i[show]
    resources :properties
    resources :contracts
  end
  resources :properties do
    resources :addresses, except: %i[show]
  end
end
