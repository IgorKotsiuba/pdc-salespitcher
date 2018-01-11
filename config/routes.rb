Rails.application.routes.draw do
  root 'landing#show'

  devise_for :users
  devise_for :admins

  authenticated :admin do
    root 'admin/users#index', as: :authenticated_root
  end

  authenticated :users do
    root 'users/posts#index', as: :authenticated_user_root
  end

  namespace :admin do
    resources :users
    resources :posts
    resources :groups
  end

  namespace :user do
    get '/posts/:uuid', to: 'posts#show'
    get '/posts',       to: 'posts#index'
  end
end
