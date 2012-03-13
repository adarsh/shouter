require "spec_helper"

describe FollowingMailer do
  it "sends a #followed_notification" do
    follower = create(:user)
    followed_user = create(:user)
    mail = FollowingMailer.followed_notification(follower, followed_user)

    mail.should have_subject("#{follower.email} is now following you")
    mail.should deliver_to(followed_user.email)
    mail.should have_body_text(/#{user_url(follower)}/)
  end
end
