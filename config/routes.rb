Rails.application.routes.draw do
  devise_for :users
  devise_for :admins

  authenticated :admin do
    root 'admin/users#index', as: :authenticated_root
  end

  namespace :admin do
    resources :users
    resources :posts
    resources :groups
  end
end
