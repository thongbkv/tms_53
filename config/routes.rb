Rails.application.routes.draw do
  root "static_pages#home"
  get "login" => "sessions#new"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"
  get "signup" => "users#new"
  resources :users, except: [:destroy]
  resources :courses, only: [:show, :index]
  resources :subjects, only: [:show, :index]

  namespace :admin do
    resources :users
    resources :courses
    resources :subjects, except: [:edit, :update, :destroy]
  end
end
