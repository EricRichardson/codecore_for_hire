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
    @profile = Profile.find params[:profile_id]
    redirect_to root_path, alert: "access defined" unless can? :edit, @profile
    @user = User.find params[:user_id]
    @project = Project.find params[:id]
  end


  def update
    @profile = Profile.find params[:profile_id]
    redirect_to root_path, alert: "access defined" unless can? :update, @profile
    @project         = Project.find params[:id]
    @profile          = @project.profile
    user = User.find params[:user_id]
    if @project.update project_params
      redirect_to user_profile_path(user, @profile), notice: "Project added!"
    else
      render "/profile"
    end
  end

  def destroy
    user = User.find params[:user_id]
    @profile = Profile.find params[:profile_id]
    redirect_to root_path, alert: "access defined" unless can? :destroy, @profile
    @project = Project.find params[:id]
    @project.destroy
    redirect_to user_profile_path(user, @profile), notice: "Answer deleted"
  end

  private

  def project_params
    params.require(:project).permit(:link, :github, :title, :description)
  end

end
