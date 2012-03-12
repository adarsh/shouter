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
end
