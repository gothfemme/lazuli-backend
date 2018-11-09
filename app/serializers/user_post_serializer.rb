class UserPostSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :is_reblog
  belongs_to :user, serializer: PostUserSerializer
  belongs_to :post, serializer: PostSerializer, key: :original_post
end
