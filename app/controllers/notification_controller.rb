class NotificationController < ApplicationController

  def index
    user = User.first
    render json: {user: user}
  end

end
