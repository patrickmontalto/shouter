module Following
  extend ActiveSupport::Concern

  # adds an included method that lets you evaluate a block in the scope of the class
  included do
    has_many :followed_user_relationships, 
      class_name: "FollowingRelationship",
      foreign_key: :follower_id
    has_many :followed_users, through: :followed_user_relationships

    has_many :follower_relationships, 
      class_name: "FollowingRelationship",
      foreign_key: :followed_user_id
    has_many :followers, through: :follower_relationships
  end

  def following?(user)
    followed_user_ids.include?(user.id)
  end
  
  def can_follow?(user)
    self != user
  end

  def follow(user)
    followed_users << user
  end

  def unfollow(user)
    followed_users.delete(user)
  end

end