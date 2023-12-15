# config/routes.rb

Rails.application.routes.draw do
  devise_for :users
  root 'users#index'

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :create] do
      resources :likes, only: [:create, :index]
      resources :comments, only: [:create]
    end
  end
end