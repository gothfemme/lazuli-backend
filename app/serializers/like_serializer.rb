class LikeSerializer < ActiveModel::Serializer
  attributes :user_id
  belongs_to :user
  belongs_to :post
end
