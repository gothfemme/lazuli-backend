class ProfileSerializer < ActiveModel::Serializer
  attributes :username, :avatar
  attribute :posts do
    object.posts.order(created_at: :desc).map { |e| ProfilePostSerializer.new(e) }
  end

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

end
