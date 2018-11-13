class UserPost < ApplicationRecord
  include Notifiable
  belongs_to :user
  belongs_to :post
  after_create do |user_post|
    if user_post.is_reblog
      Notification.create(user: user_post.post.user, notifiable: user_post)
    end
  end
end
