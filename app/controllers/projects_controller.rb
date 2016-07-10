class ProjectsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :find_user, except: [:index]
  before_action :find_profile
  before_action :find_project, only: [:edit, :update, :destroy]

  def new
    @project = Project.new
    respond_to do |format|
      format.html { render }
      format.js   { render "projects/create_success" }
    end
  end

  def create
    @project          = Project.new project_params
    @project.profile  = @profile
    if @project.save
      redirect_to user_profile_path(@user, @profile), notice: "Project added!"
    else
      render "/profile/show"
    end
  end

  def edit
    redirect_to root_path, alert: "access denied" unless can? :edit, @profile
  end

  def index
    respond_to do |format|
      format.html { render "projects/index"}
      format.js   { render "projects/display"}
    end
  end

  def update
    redirect_to root_path, alert: "access denied" unless can? :update, @profile
    @profile          = @project.profile
    if @project.update project_params
      redirect_to user_profile_path(@user, @profile), notice: "Project added!"
    else
      render "/profile"
    end
  end

  def destroy
    redirect_to root_path, alert: "access denied" unless can? :destroy, @profile
    @project.destroy
    redirect_to user_profile_path(@user, @profile), notice: "Answer deleted"
  end

  private

  def project_params
    params.require(:project).permit(:link, :github, :title, :description)
  end

  def find_project
    @project = Project.find params[:id]
  end
end
