class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :commenter, class_name: "User", foreign_key: "user_id"
  has_many :comment_likes
end
