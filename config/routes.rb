Rails.application.routes.draw do
  resources :likes, only: [:create, :destroy]
  delete 'likes/delete' => 'likes#destroy'
  resources :posts
  post 'user/token' => 'user_token#create'
  get 'users/current' => 'users#current'
  resources :users
  post 'users/:id/follow' => 'relationships#create'
  delete 'users/:id/unfollow' => 'relationships#destroy'
end
