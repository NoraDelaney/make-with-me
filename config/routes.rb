Rails.application.routes.draw do
  root 'users#index'
  devise_for :users
  resources :users do
    resources :user_files, except: [:index, :show]
    resources :pdfs, except: [:index, :show]
  end
  resources :conversations, only: [:index, :show, :new, :create] do
    member do
      post :reply
      post :trash
      post :untrash
    end
  end

  # as :user do
  #   get 'users', to: 'users_path', as: :user_root
  # end
end
