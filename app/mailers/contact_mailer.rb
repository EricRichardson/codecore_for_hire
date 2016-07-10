class ContactMailer < ApplicationMailer

  def send_contact(user, message, from)
    @user = user
    @message = message
    @from = from
    mail(to: user.email, subject:"Someone Contacted You!")
  end
end
