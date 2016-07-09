class ContactFormsController < ApplicationController

  def new
    @user = User.find params[:id]
  end

  def create
    @user = User.find params[:id]

    if @user.deliver
      flash[:notice] = "Your message was sent! They will be in contact with you soon!"
      redirect_to user_path(@user)
    else
      flash[:error] = "Cannot send message."
      redirect_to user_path(@user)
    end
  end



end
