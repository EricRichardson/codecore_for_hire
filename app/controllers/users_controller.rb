class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:new, :create, :reset]
  before_action :find_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Logged In!"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update

  end

  
  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :for_hire, :profile_picture)
  end

  def find_user
    @user = User.find(session[:user_id])
  end
end
