class UsersController < ApplicationController
  before_action :set_user, only: [:destroy]
  before_action :authenticate_user, only: [:current, :destroy]

  def current
    render json: current_user, serializer: TinyUserSerializer
  end

  def is_valid
    bool = !User.find_by(username: params[:username])
    render json: {is_valid: bool}
  end

  # GET /users
  def index
    if params[:search]
      @users = User.where('username ILIKE :query', query: "%#{params[:search]}%")
    else
      @users = User.all
    end

    render json: @users, each_serializer: TinyUserSerializer
  end

  # GET /users/1
  def show
    @user = User.find_by(username: params[:id])
    posts = @user.user_posts.order(created_at: :desc)

    render json: { current_user: ProfileSerializer.new(current_user), user: ProfileSerializer.new(@user), posts: ActiveModel::Serializer::CollectionSerializer.new(posts) }
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

  def update
    @user = User.find(current_user.id)
    if @user.update(update_params)
      render json: @user, serializer: TinyUserSerializer
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
    def update_params
      params.require(:user).permit(:email, :username, :avatar, :bio)
    end

    def user_params
      params.require(:user).permit(:email, :username, :avatar, :password, :password_confirmation, :bio)
    end
end
