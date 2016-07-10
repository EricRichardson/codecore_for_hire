class ExperiencesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :find_user, except: [:index]
  before_action :find_profile
  before_action :find_experience, only: [:edit, :update, :destroy]

  def new
    @experience = Experience.new
  end

  def create
    @experience = Experience.new experience_params
    @experience.profile = @profile
    if @experience.save
      redirect_to user_profile_path(@user, @profile), notice: "Experience Added!"
    else
      render :edit
    end
  end

  def index
    @experiences = Experience.all
    respond_to do |format|
      format.html { render "experiences/index"}
      format.js   { render "experiences/display"}
    end
  end

  def show
  end

  def edit
    redirect_to root_path, alert: "access defined" unless can? :edit, @profile
  end

  def update
    redirect_to root_path, alert: "access defined" unless can? :update, @profile
    if @experience.update experience_params
      redirect_to user_profile_path(@user, @profile), notice: "Experience Updated!"
    else
      render :edit
    end
  end

  def destroy
    redirect_to root_path, alert: "access defined" unless can? :destroy, @profile
    @experience.destroy
    redirect_to user_profile_path(@user, @profile), notice: "Experience Deleted!"
  end

  private

  def find_experience
    @experience = Experience.find params[:id]
  end

  def experience_params
    params.require(:experience).permit(:company, :title, :description, :start, :end)
  end

end
