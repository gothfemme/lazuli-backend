class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :reblogs

  def self.dashboard(user)
    Post.left_outer_joins(:reblogs).where("posts.user_id IN (?)", (user.followings) + [user]).or(Post.joins(:reblogs).where(reblogs: {user_id: (user.followings) + [user]}))
    # Post.(:reblogs).where("posts.user_id IN (?)", user.followings).or(Post.joins(:reblogs).where("reblogs.user_id IN (?)", user.followings).order(created_at: :desc)

  end
end
