Rails.application.routes.draw do
  devise_for :users,  path: 'users', controllers:  { sessions: "user/sessions" }
  devise_for :admins, path: 'admins', controllers: { sessions: "admin/sessions" }

  root to: 'landing#show'

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
