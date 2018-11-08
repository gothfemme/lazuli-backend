class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]
  before_action :authenticate_user, only: [:create, :update, :destroy]

  def dashboard
      user = User.first
      @posts = Post.where("user_id IN (?) or user_id = ?", user.followings.pluck(:id), user.id).order(created_at: :desc)
      @reblogs = Reblog.includes(:post).where("user_id IN (?) or user_id = ?", user.followings.pluck(:id), user.id).order(created_at: :desc)
      posts = @posts.map { |e| PostSerializer.new(e) }
      reblogs = @reblogs.map { |e| ReblogSerializer.new(e) }
      timeline = (posts + reblogs).sort_by{|x| x.attributes[:created_at]}.reverse
      render json: {user: ProfileSerializer.new(user),
            posts: timeline}
  end

  # GET /posts
  def index
    if params[:search]
      @posts = Post.where('title ILIKE :query OR content ILIKE :query', query: "%#{params[:search]}%").order(created_at: :desc)
    elsif current_user
      @posts = Post.where("user_id IN (?) or user_id = ?", current_user.followings.pluck(:id), current_user.id).order(created_at: :desc)
      @reblogs = Reblog.includes(:post).where("user_id IN (?) or user_id = ?", current_user.followings.pluck(:id), current_user.id).order(created_at: :desc)
      posts = @posts.map { |e| PostSerializer.new(e) }
      reblogs = @reblogs.map { |e| ReblogSerializer.new(e) }
      timeline = (posts + reblogs).sort_by{|x| x.attributes[:created_at]}.reverse
      render json: {user: ProfileSerializer.new(current_user),
            posts: timeline}
    else
      @posts = Post.all.order(created_at: :desc)
    end

    # render json: {user: ProfileSerializer.new(current_user),
    #   posts: ActiveModel::Serializer::CollectionSerializer.new(@posts), }
  end

  # GET /posts/1
  def show
    render json: @post
  end

  # POST /posts
  def create
    @post = Post.new(post_params)

    if @post.save
      render json: @post, status: :created, location: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def post_params
      params.require(:post).permit(:user_id, :title, :content, :image)
    end
end
