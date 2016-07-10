class ContactFormsMailer < ApplicationMailer

  def send_contact(user, from, message)
    @from = from
    @message = message
    mail(to: user.email, subject:"Someone contact you from CodeCore for Hire")
  end
end
