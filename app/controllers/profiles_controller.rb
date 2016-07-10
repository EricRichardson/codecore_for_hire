class ProfilesController < ApplicationController

  def new
    @profile = Profile.new
    @profile.user = User.find params[:user_id]
  end

  def create
    @profile = Profile.new profile_params
    @profile.user = User.find params[:user_id]
    @profile.user.profile = @profile
    if @profile.save
      redirect_to user_profile_path(@profile.user, @profile), notice: "Updated Project"
    else
      render :new
    end
  end

  def show
    @profile = Profile.find params[:id]
  end

  def edit
    @profile = Profile.find params[:id]
  end

  def update
    @profile = Profile.find params[:id]
    if @profile.update profile_params
      redirect_to user_profile_path(@profile.user, @profile)
    else
      render :edit
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:twitter, :github, :linkedin, :resume)
  end

end
