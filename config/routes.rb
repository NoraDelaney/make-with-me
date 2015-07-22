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
  resources :conversations do
      resources :messages
    end
  end

  # as :user do
  #   get 'users', to: 'users_path', as: :user_root
  # end
