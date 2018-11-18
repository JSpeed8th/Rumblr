Rails.application.routes.draw do
  root 'blogs#index'

  devise_for :users

  get "/users/:id/edit" => "users#edit"

  resources :users
  resources :blogs do
    resources :comments
  end
end
