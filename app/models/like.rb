class Like < ApplicationRecord
  include Notifiable
  belongs_to :user
  belongs_to :post
  after_create do |like|
    Notification.create(user: like.post.user, notifiable: like)
  end
end
