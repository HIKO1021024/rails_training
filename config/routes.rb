Rails.application.routes.draw do
  devise_for :users
  #devise_scope :user do
  #  root :to => "devise/sessions#new"
  #end
  root 'articles#index'
  get 'sessions/new'
  post 'sessions/new'
  post 'users/new' ,to: 'users#create'
  resources :users
  resources :articles
  get 'login/index'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  mount ActionCable.server => '/cable'
end