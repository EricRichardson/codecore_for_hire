class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead
  protect_from_forgery unless: -> { request.format.json? }

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def user_signed_in?
    session[:user_id].present?
  end
  helper_method :user_signed_in?

  def authenticate_user!
    redirect_to new_session_path, alert: "please sign in" unless user_signed_in?
  end

  def default_image
    @image = 'default-cat.jpg'
  end
  helper_method :default_image

  def find_user
    @user = User.find params[:user_id]
  end
  helper_method :find_user

  def find_profile
    @profile = Profile.find params[:profile_id]
  end
  helper_method :find_profile

end
