Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'tasks#index'
  resources :tasks do
    member do
      post :execute
      post :finish
    end
  end

  resources :users, only: [:new, :create, :show]
  get 'signup', to: 'users#new', as: 'signup'

  resources :sessions, only: [:new, :create, :destroy]
  get 'login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  namespace :admin do
    root 'users#index'
    resources :users
  end
end
