Rails.application.routes.draw do
  devise_for :users
  root 'main#index'
  get 'logout', to: 'sessions#destroy'
  post 'properties/search', to: 'properties#search', as: 'search_properties'
  resources :users, only: %i[] do
    resources :addresses, except: %i[show]
    resources :properties
    resources :contracts
  end
  resources :properties do
    resources :addresses, except: %i[show]
  end
end
