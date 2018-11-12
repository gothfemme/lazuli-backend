class CommentLike < ApplicationRecord
  belongs_to :comment_liker, class_name: "User", foreign_key: "user_id"
  belongs_to :comment
end
