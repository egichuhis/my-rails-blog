# config/routes.rb

Rails.application.routes.draw do
  get 'posts/index'
  get 'posts/show'
  get 'users/index'
  get 'users/show'
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show]
  end
  resources :posts, only: [] do
    resources :comments, only: [:create]
    resources :likes, only: [:create]
  end
end
