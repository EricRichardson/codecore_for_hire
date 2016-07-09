class ProfilesController < ApplicationController

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new profile_params
    @profile.user = User.find params[:user_id]
    if @profile.save
      redirect_to user_profile_path(@profile.user @profile)
    else
      render :new
    end
  end

  def edit
    @profile = Profile.find params[:id]
  end

  def update
    @profile = Profile.find params[:id]
    if @profile.update params[:id]
      redirect_to user_profile_path(@profile.user @profile)
    else
      render :edit
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:twitter, :github, :linkedin)
  end

end
