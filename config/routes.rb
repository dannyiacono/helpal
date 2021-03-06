Rails.application.routes.draw do
  patch 'profiles/update'
  get 'profiles/edit'
  get '/my_profile/', to: "profiles#my_profile", as: :my_profile
  get '/profiles/:id', to: "profiles#other_profile", as: :other_profile
  get '/help_others', to: "requests#help_others", as: :help_others
  # post '/reviews', to: "reviews#create", as: :create_review

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :conversations, only: [:index, :show, :create] do
    resources :messages, only: [:index, :show, :create, :new]
  end
  resources :categories, only: :index

  resources :requests, only: [:create, :new, :show, :destroy, :index, :update] do
    resources :reviews, only: [:create]
  end

  resources :conversations, only: :show do
  resources :messages, only: :create
  end
end
