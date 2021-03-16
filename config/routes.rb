Rails.application.routes.draw do
  root 'main#index'
  get 'logout', to: 'sessions#destroy'
  resources :sessions, only: %i[new create]
  resources :users, only: %i[new create edit update] do
    resources :addresses, only: %i[new create index update edit destroy]
    resources :properties, only: %i[new create edit update destroy index]
  end
  resources :properties, only: %i[new create edit update destroy index] do
    resources :addresses, only: %i[new create index update edit destroy]
  end
end
