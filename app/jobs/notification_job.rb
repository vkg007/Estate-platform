class NotificationJob < ApplicationJob
  queue_as :default

  def perform(user_id)
    # byebug
    @user = User.find(user_id)
    UserMailer.welcome_email(@user).deliver_now
  end
end
