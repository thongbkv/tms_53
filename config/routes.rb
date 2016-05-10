Rails.application.routes.draw do
  root "static_pages#home"
  get "login" => "sessions#new"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"
  get "signup" => "users#new"
  resources :users, except: [:edit, :update, :destroy]
  resources :courses, only: [:show, :index]

  namespace :admin do
    resources :users
    resources :courses, except: [:edit, :update, :destroy]
  end
end
