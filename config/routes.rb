Rails.application.routes.draw do
  patch 'profiles/update'
  get 'profiles/edit'
  get '/my_profile/', to: "profiles#my_profile", as: :my_profile
  get '/profiles/:id', to: "profiles#other_profile", as: :other_profile

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :conversations, only: [:index, :show, :create] do
    resources :messages, only: [:index, :show, :create, :new]
  end
  resources :categories, only: :index
  resources :requests, only: [:create, :new, :show, :destroy]
  resources :conversations, only: :show do
  resources :messages, only: :create
  end
end
