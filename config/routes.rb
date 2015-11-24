Rails.application.routes.draw do
  devise_for :users
  resources :posts do
    resources :messages, only: [:create]
  end
  root 'posts#index'
end
