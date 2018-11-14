Rails.application.routes.draw do
  resources :notifications
  resources :user_posts
  resources :likes, only: [:create, :destroy]
  delete 'likes/delete' => 'likes#destroy'
  # resources :comment_likes
  resources :posts do
    resources :comments
  end
  patch 'settings' => 'users#update'
  get 'users/is_valid' => 'users#is_valid'
  post '/posts/:post_id/comments/:comment_id/like' => 'comment_likes#create'
  delete '/posts/:post_id/comments/:comment_id/unlike' => 'comment_likes#destroy'
  post 'user/token' => 'user_token#create'
  get 'users/current' => 'users#current'
  resources :users
  get 'timeline' => 'user_posts#timeline'
  post 'reblogs' => 'user_posts#reblog'
  delete 'reblogs/delete' => 'user_posts#unreblog'
  post 'users/:id/follow' => 'relationships#create'
  delete 'users/:id/unfollow' => 'relationships#destroy'
end
