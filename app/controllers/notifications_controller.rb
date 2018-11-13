class NotificationsController < ApplicationController
  before_action :authenticate_user
  def index
    @notifications = current_user.notifications

    render json: @notifications
  end

end
