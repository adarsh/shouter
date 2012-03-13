class FollowingMailer < ActionMailer::Base
  default from: "from@example.com"
  def followed_notification(follower, followed_user)
    @follower = follower
    mail(
      to: followed_user.email,
      subject: "#{follower.email} is now following you"
    )
  end
end
