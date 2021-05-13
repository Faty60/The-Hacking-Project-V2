Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :gossips do
    resources :comments, only: [:show]
  end
  resources :users, only: [:show, :new] do
    resources :private_messages, only: [:show]
  end
  resources :cities, only: [:show]
  resources :tags, only: [:show]
  get '/team', to: 'static#team'
  get '/contact', to: 'static#contact'
  get 'welcome/:first_name', to: 'welcome#show'
  root 'gossips#index'
  get '/', to: 'gossips#index'

  resources :sessions, only:[:new, :create, :destroy]
end
