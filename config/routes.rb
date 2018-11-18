Rails.application.routes.draw do
  root 'blogs#index'

  devise_for :users

  resources :users
  resources :blogs do
    resources :comments
  end
end
