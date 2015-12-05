Rails.application.routes.draw do
  devise_for :users
  resources :posts do
    resources :messages, only: [:create]
    resources :favorites, only: [:create]
  end
  resources :users, only: [:show]
  root 'posts#index'
end
