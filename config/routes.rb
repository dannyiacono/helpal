Rails.application.routes.draw do
  get 'requests/new'
  get 'requests/create'
  devise_for :users
  root to: 'pages#home'
  resources :categories, :index
  resources :requests, only: [:create, :new]
end
