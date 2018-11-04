class User < ApplicationRecord
  has_secure_password

  has_many :posts

  validates :email, :password, :username, presence: true
  validates :username, uniqueness: true, length: { maximum: 24 }
  validates :password, length: { minimum: 8 }

end
