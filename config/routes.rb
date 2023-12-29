# config/routes.rb

Rails.application.routes.draw do
  devise_for :users
  root 'users#index'

  namespace :api do
    namespace :v1, defaults: { format: 'json' } do
      resources :users, only: [:show] do
        resources :posts, only: [:index]
      end

      resources :posts, only: [] do
        resources :comments, only: [:index, :create]
      end
    end
  end

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :create, :destroy] do
      resources :likes, only: [:create, :index]
      resources :comments, only: [:create, :destroy]
    end
  end
end