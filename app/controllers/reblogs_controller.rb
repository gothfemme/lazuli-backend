class ReblogsController < ApplicationController
  before_action :set_reblog, only: [:show, :update, :destroy]

  # GET /reblogs
  def index
    @reblogs = Reblog.all

    render json: @reblogs
  end

  # GET /reblogs/1
  def show
    render json: @reblog
  end

  # POST /reblogs
  def create
    @reblog = Reblog.new(reblog_params)

    if @reblog.save
      render json: @reblog, status: :created, location: @reblog
    else
      render json: @reblog.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /reblogs/1
  def update
    if @reblog.update(reblog_params)
      render json: @reblog
    else
      render json: @reblog.errors, status: :unprocessable_entity
    end
  end

  # DELETE /reblogs/1
  def destroy
    @reblog.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reblog
      @reblog = Reblog.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def reblog_params
      params.require(:reblog).permit(:user_id, :post_id)
    end
end
