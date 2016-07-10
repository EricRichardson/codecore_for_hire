class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:new, :create, :index]
  before_action :current_user, only: [:edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    @profile = Profile.new
    @profile.user = @user
    @user.profile = @profile
    if @user.save && @profile.save
      session[:user_id] = @user.id
      redirect_to new_user_profile_path(@user), notice: "Logged In!"
    else
      render :new
    end
  end

  def show
    redirect_to user_profile_path(@user, @user.profile)
  end

  def index
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
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]
    if @user.update user_params
      redirect_to root_path
    else
      render :edit
    end
  end


  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :for_hire, :image)
  end

  # def find_user
  #   @user = User.find(session[:user_id])
  # end
end
