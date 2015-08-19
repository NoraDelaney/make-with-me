Rails.application.routes.draw do
  root 'users#index'
  devise_for :users
  resources :searches, only: [:index]
  resources :users do
    resources :user_files, except: [:index, :show]
    resources :pdfs, except: [:index, :show]
  end
  resources :users do
    member do
      put "like", to: "users#like"
      put "dislike", to: "users#dislike"
    end
  end
  namespace :admin do
    resources :users, only: [:index]
  end

  resources :charts, only: [:index]
  end
