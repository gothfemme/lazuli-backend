class NotificationSerializer < ActiveModel::Serializer
  attributes :id, :created_at
attribute :notifiable do
    case object.notifiable_type
    when "Like"
      {type: "liked", notifier: PostUserSerializer.new(object.notifiable.user), post: TinyPostSerializer.new(object.notifiable.post)}
    when "UserPost"
      {type: "reblogged", notifier: PostUserSerializer.new(object.notifiable.user), post: TinyPostSerializer.new(object.notifiable.post)}
    when "Comment"
      {type: "commented", notifier: PostUserSerializer.new(object.notifiable.commenter), post: TinyPostSerializer.new(object.notifiable.post)}
    end
  end
end
