Rails.application.routes.draw do
  resources :user_posts
  resources :likes, only: [:create, :destroy]
  delete 'likes/delete' => 'likes#destroy'
  resources :posts
  post 'user/token' => 'user_token#create'
  get 'users/current' => 'users#current'
  resources :users
  get 'timeline' => 'user_posts#timeline'
  post 'reblogs' => 'user_posts#reblog'
  delete 'reblogs/delete' => 'user_posts#unreblog'
  post 'users/:id/follow' => 'relationships#create'
  delete 'users/:id/unfollow' => 'relationships#destroy'
end
