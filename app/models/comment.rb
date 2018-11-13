class Comment < ApplicationRecord
  include Notifiable
  belongs_to :post
  belongs_to :commenter, class_name: "User", foreign_key: "user_id"
  validates :content, presence: :true, length: { maximum: 140 }
  has_many :comment_likes
  after_create do |comment|
    Notification.create(user: comment.post.user, notifiable: comment)
  end
end
