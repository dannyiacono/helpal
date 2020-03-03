Rails.application.routes.draw do
  get 'messages/index'
  get 'messages/show'
  get 'messages/create'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :conversations do
    resources :messages
  end
end
