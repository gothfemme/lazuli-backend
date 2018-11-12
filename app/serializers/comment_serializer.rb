class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :created_at
  belongs_to :commenter, serializer: PostUserSerializer
  attribute :likes do
    object.comment_likes.pluck(:user_id)
  end
end
