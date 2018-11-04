class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :avatar
  has_many :posts
end
