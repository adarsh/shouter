class FollowingRelationshipsController < ApplicationController
  def create
    user = User.find(params[:user_id])
    # current_user.following_relationships.create(followed_user: user)
    current_user.follow(user)
    redirect_to user, notice: "Now following"
  end
end
