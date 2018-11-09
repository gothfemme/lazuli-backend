class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :image, :created_at
  attribute :author do
    PostUserSerializer.new(object.user)
  end

  attribute :like_count do
    object.likes.count
  end

  attribute :reblog_count do
    object.reblog_count
  end

  attribute :likes do
    object.likes.pluck(:user_id)
  end

  attribute :reblogs do
    object.reblogs
  end

end
