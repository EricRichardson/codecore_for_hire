class ExperiencesController < ApplicationController

before_action :find_experience, only: [:show, :edit, :update, :destroy]
before_action :experience_params, only: [:create, :update]

  def new
    @user = User.find params[:user_id]
    @profile = Profile.find params[:profile_id]
    @experience = Experience.new
  end

  def create
    @experience = Experience.new experience_params
    user = User.find params[:user_id]
    profile = user.profile
    @experience.profile = profile
    if @experience.save
      redirect_to user_profile_path(user, profile), notice: "Experience Added!"
    else
      render :edit
    end
  end

  def index
    @experiences = Experience.all
  end

  def show
  end

  def edit
    @profile = Profile.find params[:profile_id]
    redirect_to root_path, alert: "access defined" unless can? :edit, @profile
    @experience = Experience.find params[:id]
    @user = User.find params[:user_id]
  end

  def update
    user = User.find params[:user_id]
    @profile = Profile.find params[:profile_id]
    redirect_to root_path, alert: "access defined" unless can? :update, @profile
    if @experience.update experience_params
      redirect_to user_profile_path(user, @profile), notice: "Experience Updated!"
    else
      render :edit
    end
  end

  def destroy
    user = User.find params[:user_id]
    @profile = Profile.find params[:profile_id]
    redirect_to root_path, alert: "access defined" unless can? :destroy, @profile
    @experience.destroy
    redirect_to user_profile_path(user, @profile), notice: "Experience Deleted!"
  end

  private

  def find_experience
    @experience = Experience.find params[:id]
  end

  def experience_params
    params.require(:experience).permit(:company, :title, :description, :start, :end)
  end

end
