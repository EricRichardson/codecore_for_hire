class ContactFormsController < ApplicationController

  def new
    @user = User.find params[:id]
  end

  def create
    @user = User.find params[:id]
    @profile = @user.profile
    if @user
      ContactMailer.send_contact(@user, params[:message], params[:from]).deliver_now
      flash[:notice] = "Your message was sent! They will be in contact with you soon!"
      redirect_to user_profile_path(@user, @profile)
    else
      flash[:error] = "Cannot send message."
      redirect_to user_profile_path(@user, @profile)
    end
  end



end
