class UsersController < ApplicationController
  before_action :set_user, only: [:update, :destroy]
  before_action :authenticate_user, only: [:current, :update, :destroy]

  def current
    render json: current_user, serializer: TinyUserSerializer
  end

  # GET /users
  def index
    if params[:search]
      @users = User.where('username ILIKE :query', query: "%#{params[:search]}%")
    else
      @users = User.all
    end

    render json: @users
  end

  # GET /users/1
  def show
    @user = User.find_by(username: params[:id])
    @posts = @user.posts.order(created_at: :desc)
    @reblogs = @user.reblogs.includes(:post).order(created_at: :desc)
    posts = @posts.map { |e| PostSerializer.new(e) }
    reblogs = @reblogs.map { |e| ReblogSerializer.new(e) }
    timeline = (posts + reblogs).sort_by{|x| x.attributes[:created_at]}.reverse
    render json: {user: ProfileSerializer.new(@user),
          posts: timeline}
    # render json: @user, serializer: ProfileSerializer
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:email, :username, :avatar, :password, :password_confirmation)
    end
end
