require 'spec_helper'

describe User do
  it "can #create_shout" do
    text_shout = build(:text_shout)
    user = create(:user)
    shout = user.create_shout(text_shout)
    shout.medium.body.should == text_shout.body
    shout.user.should == user
    shout.persisted?.should == true
    text_shout.persisted?.should == true
  end

  it "can #follow other users" do
    follower = create(:user)
    followed_user = create(:user)
    follower.follow(followed_user)

    follower.followed_users.should == [followed_user]
  end

  it "knows if it #can_follow a user" do
    follower = create(:user)
    followed_user = create(:user)
    unfollowed_user = create(:user)
    follower.follow(followed_user)

    follower.can_follow?(follower).should be_false
    follower.can_follow?(followed_user).should be_false
    follower.can_follow?(unfollowed_user).should be_true
  end
end
