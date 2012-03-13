class User < ActiveRecord::Base
  include Clearance::User
  has_many :shouts

  has_many :followed_user_relationships,
    foreign_key: "following_user_id",
    class_name: "FollowingRelationship"
  has_many :followed_users,
    through: :following_relationships

  has_many :following_users,
    through: :following_relationships
  has_many :following_user_relationships,
    foreign_key: "followed_user_id",
    class_name: "FollowingRelationship"
  has_many :followers,
    through: :following_user_relationships,
    source: :following_user

  attr_accessible :email, :password

  def create_shout(medium)
    shouts.create(medium: medium)
  end

  def follow(user)
    # following_relationships.create(followed_user: user)
    followed_users << user
  end

  def can_follow?(user)
    # return false if self == user
    # return false if self.followed_users.include?(user)
    !self_and_followed_user_ids.include?(user.id)
  end

  private
  def self_and_followed_user_ids
    [id] + followed_user_ids
  end
end
