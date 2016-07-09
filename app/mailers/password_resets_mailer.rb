class PasswordResetsMailer < ApplicationMailer
  def send_reset (user, url)
    @url = url
    mail(to: user.email, subject:"Codecore for Hire Password Reset")
  end
end
