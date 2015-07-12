Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users
  resources :users
  resources :conversations, only: [:index, :show, :new, :create] do
    member do
      post :reply
      post :trash
      post :untrash
    end
  end

  as :user do
    get 'users', to: 'users_path', as: :user_root
  end
end
