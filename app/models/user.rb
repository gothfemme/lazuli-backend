class User < ApplicationRecord
  has_secure_password

  has_many :posts
  has_many :likes
  has_many :reblogs
  has_many :active_relationships, class_name:  "Relationship",
                                foreign_key: "follower_id",
                                dependent:   :destroy
  has_many :passive_relationships, class_name:  "Relationship",
                                foreign_key: "followed_id",
                                dependent:   :destroy

  has_many :followings, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  validates :email, :password, :username, presence: true
  validates :username, uniqueness: true, length: { maximum: 24 }
  validates :password, length: { minimum: 8 }

end
