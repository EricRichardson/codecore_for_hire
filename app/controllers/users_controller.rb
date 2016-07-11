class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:new, :create, :index, :autocomplete]
  before_action :current_user, only: [:edit, :update, :destroy]
  before_action :find_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
<<<<<<< HEAD
    @profile = Profile.new
    @profile.user = @user
    @user.profile = @profile
    if @user.save && @profile.save
      ActivationsMailer.activation_notification_admin(@user).deliver_now
      session[:user_id] = @user.id
      redirect_to new_user_profile_path(@user), notice: "Logged In!"
    else
      render :new
    end
  end

  def show
    @user = User.find params[:id]
    redirect_to user_profile_path(@user, @user.profile)
  end

  def index
    @admin = User.where(User.arel_table[:admin].eq(true))
    if params[:hire?]
      @header = "Students for Hire"
      @page = params[:page].to_i
      @users = User.where(for_hire: true).order(created_at: :desc).page(@page).per(10)
    else
      @header = "All Students"
      @page = params[:page].to_i
      @users = User.order(created_at: :desc).page(@page).per(10)
    end
  end

  def edit
  end

  def update
    if @user.update user_params
      redirect_to root_path
    else
      render :edit
    end
  end

#   def autocomplete
#   users = User.all.map do |user|
#     {
#       name: user.first_name,
#       email: user.email
#     }
#   end
#
#   render json: users
# end

  private

  def find_user
    @user = User.find(session[:user_id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :for_hire, :image)
  end
end
