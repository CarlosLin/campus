Rails.application.routes.draw do
  devise_for :users
  resources :posts do
    resources :messages, only: [:create]
    resources :favorites, only: [:create]
  end
  resources :users, only: [:show]
  get '/info' => 'users#info', :as => "user_infos"
  get '/historys' => 'users#history', :as => "historys"
  root 'posts#index'
end
