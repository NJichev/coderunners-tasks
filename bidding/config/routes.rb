Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  get 'register', to: 'users#new'
  post 'register', to: 'users#create'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :products
  root 'products#index'
end
