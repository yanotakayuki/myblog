Rails.application.routes.draw do
  devise_for :users
  resources :blogs
  resources :users, only: [:show]
end
