Rails.application.routes.draw do
  root 'blogs#index'

  devise_for :users

  get "/users/:id/edit" => "users#edit"
  get "/blogs/:id/edit" => "blogs#edit"

  resources :users
  resources :blogs do
    resources :comments
  end
end
