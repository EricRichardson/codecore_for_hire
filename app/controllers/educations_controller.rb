class EducationsController < ApplicationController

  def index
    @educations = Education.all
  end

  def new
    @user = User.find params[:user_id]
    @profile = Profile.find params[:profile_id]
    @education = Education.new
  end

  def create
    @education = Education.new education_params
    user = User.find params[:user_id]
    profile = user.profile
    @education.profile = profile
    if @education.save
      redirect_to user_profile_path(user, profile), notice: "New education added!"
    else
      flash[:alert] = "Education could not be added"
      render :new
    end
  end

  def edit
    @education = Education.find(params[:id])
    @profile = Profile.find params[:profile_id]
    @user = User.find params[:user_id]
  end

  def update
    user = User.find params[:user_id]
    @profile = Profile.find params[:profile_id]
    @education = Education.find(params[:id])
    if @education.update education_params
      redirect_to user_profile_path(user, @profile), notice: "New education updated!"
    else
      flash[:alert] = "Education not updated"
      render :edit
    end
  end

  def destroy
    user = User.find params[:user_id]
    @profile = Profile.find params[:profile_id]
    education = Education.find(params[:id])
    education.destroy
    redirect_to user_profile_path(user, @profile), notice: "Education deleted"
  end

  private

  def education_params
    params.require(:education).permit(:school, :major, :description, :start, :end)
  end

end
