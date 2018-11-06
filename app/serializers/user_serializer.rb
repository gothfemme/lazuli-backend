class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :avatar
  has_many :posts
  attribute :follow_count do
    object.followers.count
  end
end
