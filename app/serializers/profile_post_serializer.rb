class ProfilePostSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :image
  attribute :timestamp do
     object.created_at.strftime("%b %e, %Y at %l:%M %p")
  end
  has_many :likes, include: true
end
