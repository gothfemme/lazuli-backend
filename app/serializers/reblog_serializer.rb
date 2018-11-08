class ReblogSerializer < ActiveModel::Serializer
  attributes :created_at
  attribute :is_reblog do
    true
  end

  attribute :reblogged_by do
    PostUserSerializer.new(object.user)
  end

  attribute :id do
    object.post.id
  end

  attribute :title do
    object.post.title
  end

  attribute :content do
    object.post.content
  end

  attribute :image do
    object.post.image
  end

  attribute :like_count do
    object.post.likes.count
  end
  attribute :retweet_count do
    object.post.reblogs.count
  end

  attribute :timestamp do
     object.post.created_at.strftime("%b %e, %Y at %l:%M %p")
  end
  # belongs_to :user, serializer: PostUserSerializer
  attribute :likes do
    object.post.likes.pluck(:user_id)
  end

  attribute :user do
    PostUserSerializer.new(object.post.user)
  end


end
