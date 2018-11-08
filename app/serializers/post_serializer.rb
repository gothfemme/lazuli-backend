class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :image, :created_at
  attribute :timestamp do
     object.created_at.strftime("%b %e, %Y at %l:%M %p")
  end
  belongs_to :user, serializer: PostUserSerializer
  attribute :like_count do
    object.likes.count
  end
  attribute :retweet_count do
    object.reblogs.count
  end
  attribute :likes do
    object.likes.pluck(:user_id)
  end
end
