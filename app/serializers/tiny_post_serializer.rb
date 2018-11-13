class TinyPostSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :image
end
