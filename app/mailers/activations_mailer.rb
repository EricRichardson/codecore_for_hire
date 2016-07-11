class ActivationsMailer < ApplicationMailer

  def activation_notification_admin(user)
    @user = user
    mail(to: 'driftingeric@gmail.com', subject:"User is awaiting activation.")
  end

  def activated_notification(user)
    @user = user
    mail(to: user.email, subject:"Your account has been activated.")
  end

end
