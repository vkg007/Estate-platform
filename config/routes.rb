Rails.application.routes.draw do
  root 'main#index'

  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  get 'logout', to: 'sessions#destroy'

  resources :users
  resources :sessions
  
end
  
  
