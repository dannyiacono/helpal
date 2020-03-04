Rails.application.routes.draw do

  get 'requests/new'
  get 'requests/create'

  patch 'profiles/update'
  get 'profiles/edit'
  get '/my_profile/', to: "profiles#my_profile", as: :my_profile
  get '/profiles/:id', to: "profiles#other_profile", as: :other_profile

  devise_for :users
  root to: 'pages#home'
  resources :categories, only: :index
  resources :requests, only: [:create, :new]
  resources :conversations, only: :show do
    resources :messages, only: :create
  end
end
