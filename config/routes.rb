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
    resources :courses do
      resource :assign_trainers, only: [:edit, :update]
      resource :assign_trainees, only: [:edit, :update]
    end
    resources :subjects
    resources :user_courses, only: [:destroy]
  end
end
