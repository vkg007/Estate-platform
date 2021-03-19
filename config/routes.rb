Rails.application.routes.draw do
  root 'main#index'
  get 'logout', to: 'sessions#destroy'
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
