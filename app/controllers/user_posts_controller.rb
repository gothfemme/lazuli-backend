class UserPostsController < ApplicationController
  before_action :set_user_post, only: [:show, :update, :destroy]

  def reblog
    @user_post = UserPost.new(user: current_user, post_id: params[:post_id], is_reblog: true)
    if @user_post.save
      render json: @user_post, status: :created
    else
      render json: @user_post.errors, status: :unprocessable_entity
    end
  end

  def unreblog
    @reblog = UserPost.find_by(post_id: params[:post_id], user: current_user, is_reblog: true)
    @reblog.destroy
  end

  def timeline
    if current_user
      @user_posts = UserPost.includes(:user, post: [:likes, :user, :user_posts]).where(user_id: (current_user.followings) + [current_user]).order(created_at: :desc)
      posts = ActiveModel::Serializer::CollectionSerializer.new(@user_posts)
      render json: {current_user: ProfileSerializer.new(current_user),
        posts: posts}
    else
      @user_posts = UserPost.includes(:user, post: [:likes, :user]).order(created_at: :desc)
    end

  end

  # GET /user_posts
  def index
    @user_posts = UserPost.all

    render json: @user_posts
  end

  # GET /user_posts/1
  def show
    render json: @user_post
  end

  # POST /user_posts
  def create
    @user_post = UserPost.new(user_post_params)

    if @user_post.save
      render json: @user_post, status: :created, location: @user_post
    else
      render json: @user_post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /user_posts/1
  def update
    if @user_post.update(user_post_params)
      render json: @user_post
    else
      render json: @user_post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /user_posts/1
  def destroy
    @user_post.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_post
      @user_post = UserPost.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_post_params
      params.require(:user_post).permit(:user_id, :post_id)
    end
end
