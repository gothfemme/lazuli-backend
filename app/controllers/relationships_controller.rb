class RelationshipsController < ApplicationController
  before_action :set_relationship, only: [:show, :update]
  before_action :authenticate_user

  # GET /relationships
  def index
    @relationships = Relationship.all

    render json: @relationships
  end

  # GET /relationships/1
  def show
    render json: @relationship
  end

  # POST /relationships
  def create
    @relationship = Relationship.new(follower: current_user, followed: User.find_by(username: params[:id]))

    if @relationship.save
      render json: @relationship, status: :created
    else
      render json: @relationship.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /relationships/1
  def update
    if @relationship.update(relationship_params)
      render json: @relationship
    else
      render json: @relationship.errors, status: :unprocessable_entity
    end
  end

  # DELETE /relationships/1
  def destroy
    @relationship = Relationship.find_by(follower: current_user, followed: User.find_by(username: params[:id]))
    @relationship.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_relationship
      @relationship = Relationship.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def relationship_params
      params.require(:relationship).permit(:follower_id, :followed_id)
    end
end
