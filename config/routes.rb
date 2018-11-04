Rails.application.routes.draw do
  resources :posts
  post 'user/token' => 'user_token#create'
  get 'users/current' => 'users#current'
  resources :users
end
