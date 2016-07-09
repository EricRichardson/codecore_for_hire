class ContactFormsController < ApplicationController

  def new
    @user = User.find params[:id]
  end

  def create
    @user = Contact_form.new(params[:user])
    @user.request = request
    if @user.deliver
      flash.now[:notice] = "Your message was sent! They will be in contact with you soon!"
    else
      flash.now[:error] = "Cannot send message."
      render "/users/new"
    end
  end
end
