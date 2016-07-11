class PasswordResetsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email params[:email]
    if user
      token = SecureRandom.urlsafe_base64
      user.reset_token = token
      url = edit_password_reset_url(user) + "/?token=#{token}"
      PasswordResetsMailer.send_reset(user, url).deliver_later
      redirect_to root_path, notice: "Reset email sent"
    else
      redirect_to root_path
    end
  end

  def edit
    @token
  end

  def update
    user = User.find params[:id]
    if user && params[:new_password] == params[:new_password_confirmation]
      user.update password: params[:new_password]
      redirect_to root_path, notice: "Password Reset"
    else
      flash[:alert] = "An error has occured"
      render :edit
    end
  end
end
