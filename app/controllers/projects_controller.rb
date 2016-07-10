class ProjectsController < ApplicationController

  def new
    @user = User.find params[:user_id]
    @project = Project.new
    @profile = Profile.find params[:profile_id]
  end

  def create
    @project          = Project.new project_params
    user = User.find params[:user_id]
    # @profile = user.profile
    profile           = Profile.find params[:profile_id]
    @project.profile  = profile
    if @project.save
      redirect_to user_profile_path(user, profile), notice: "Project added!"
    else
      render "/profile/show"
    end
  end

  def edit
    @project = Project.find params[:id]
  end


  def update
    @project         = Project.find params[:id]
    profile          = @project.profile
    if @project.update project_params
      redirect_to profile_path(profile), notice: "Project added!"
    else
      render "/profile"
    end
  end

  def destroy
    profile = Profile.find params[:profile_id]
    @project = Project.find params[:id]
    @project.destroy
    redirect_to profile_path(profile), notice: "Answer deleted"
  end

  private

  def project_params
    params.require(:project).permit(:link, :github, :title, :description)
  end

end
