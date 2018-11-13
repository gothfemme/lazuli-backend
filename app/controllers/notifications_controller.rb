class NotificationsController < ApplicationController
  def index

    @notifications = User.first.notifications

    render json: @notifications
  end

end
