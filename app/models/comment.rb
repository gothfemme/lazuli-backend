class Comment < ApplicationRecord
  include Notifiable
  belongs_to :post
  belongs_to :commenter, class_name: "User", foreign_key: "user_id"
  has_many :comment_likes
  after_create do |comment|
    Notification.create(user: comment.post.user, notifiable: comment)
  end
end
