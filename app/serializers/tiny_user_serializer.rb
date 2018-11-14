class TinyUserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :avatar, :bio
end
