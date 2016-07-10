class ContactFormsController < ApplicationController

  def new
    @user = User.find params[:id]
  end

  def create
    user = User.find_by_email params[:email]
    from = params[:from]
    message = params[:message]
    if user
      ContactFormsMailer.send_contact(user, from, message).deliver_now
      flash[:notice] = "Your message was sent! They will be in contact with you soon!"
      redirect_to user_profile_path(user, user.profile)
    else
      flash[:error] = "Cannot send message."
      redirect_to user_profile_path(user, user.profile)
    end
  end

end
