require 'spec_helper'

describe Shout do
  it "returns .current shouts in reverse chronological order" do
    older_shout = create(:shout)
    newer_shout = create(:shout)
    Shout.current.should == [newer_shout, older_shout]
  end
end
