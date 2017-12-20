Rails.application.routes.draw do
  mount Ckeditor::Engine => "/ckeditor"
  root "book_review#show", page: "home"
  get "book_review/:page", to: "book_review#show"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :users, only: [:edit, :update]
  namespace :admin do
    resources :books, expect: [:index, :show]
    resources :users, only: [:update, :destroy]
  end
  resources :genres, only: [:show, :index]
  post "/rate", to: "rater#create", as: "rate"
  resources :users, only: [:show, :index] do
    resources :relationships, only: :index
  end
  resources :books, only: [:show, :index] do
    resources :reviews, except: [:index]
  end
  resources :reviews, only: :index
  resources :relationships, only: [:create, :destroy ]
end
