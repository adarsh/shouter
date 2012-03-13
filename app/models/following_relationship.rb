class FollowingRelationship < ActiveRecord::Base
  belongs_to :following_user, class_name: "User"
  belongs_to :followed_user, class_name: "User"
end
