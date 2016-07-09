class NewUserMailer < ApplicationMailer

  def new_user_notification(user)
    @user = user
    mail(to: user.email, subject:"Member Waiting Verification")
  end
end
