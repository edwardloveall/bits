Bits::Application.routes.draw do
  root to: 'items#index'

  get 'signup', to: 'users#new', as: :signup
  get 'login', to: 'sessions#new', as: :login
  get 'logout', to: 'sessions#destroy', as: :logout
  get 'new', to: 'items#new', as: 'new_item'

  resources :items
  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  get 'feed' => 'items#index', defaults: { format: 'rss'}, as: :feed
end
