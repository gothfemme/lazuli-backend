class ProfileSerializer < ActiveModel::Serializer
  attributes :id, :username, :avatar, :bio

  attribute :follower_ids do
    object.followers.pluck :id
  end

  attribute :following_ids do
    object.followings.pluck :id
  end

  attribute :follow_count do
    object.followers.count
  end

  attribute :following_count do
    object.followings.count
  end

  attribute :reblogs do
    object.reblogs
  end

  attribute :likes do
    object.likes.pluck(:post_id)
  end

end
