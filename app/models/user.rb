class User < ActiveRecord::Base
  include Following
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true

  has_many :shouts
end