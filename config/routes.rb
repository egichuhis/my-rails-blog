# config/routes.rb

Rails.application.routes.draw do
  root 'users#index'

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :create, :destroy] do
      resources :likes, only: [:create, :index]
      resources :comments, only: [:create, :destroy]
    end
  end
end