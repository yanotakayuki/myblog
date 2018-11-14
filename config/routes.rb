Rails.application.routes.draw do
  root 'blogs#index'
  get  'blogs'     => 'blogs#index'
  get  'blogs/new' => 'blogs#new'
  post 'blogs'     => 'blogs#create'
end
