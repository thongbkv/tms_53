Rails.application.routes.draw do
  root "static_pages#home"
  get "login" => "sessions#new"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"
  get "signup" => "users#new"
  resources :users, except: [:destroy]
  resources :courses, only: [:show, :index]
  resources :subjects, only: [:show, :index]
  resources :users do
    resources :relationships, only: [:index]
  end
  resources :relationships, only: [:create, :destroy, :show]
  namespace :admin do
    resources :users
    resources :courses, except: [:edit, :update, :destroy]
    resources :subjects, except: [:edit, :update, :destroy]
  end
end
