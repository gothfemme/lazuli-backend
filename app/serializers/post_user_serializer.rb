class PostUserSerializer < ActiveModel::Serializer
  attributes :id, :username, :avatar
  has_many :posts
end
