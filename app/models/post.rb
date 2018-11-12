class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :user_posts, dependent: :destroy
  has_many :comments

  def reblog_count
    self.user_posts.where(is_reblog: true).count
  end

  def reblogs
    self.user_posts.where(is_reblog: true).pluck(:user_id)
  end
end
