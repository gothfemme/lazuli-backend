Rails.application.routes.draw do
  resources :relationships
  resources :likes
  delete 'likes/delete' => 'likes#destroy'
  resources :posts
  post 'user/token' => 'user_token#create'
  get 'users/current' => 'users#current'
  resources :users
end
