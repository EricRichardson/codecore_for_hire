class ExperiencesController < ApplicationController

before_action :find_experience, only: [:show, :edit, :update, :destroy]
before_action :experience_params, only: [:create, :update]

  def new
    @experience = Experience.new
  end

  def create
    @experience = Experience.new(experience_params)
    if @experience.save
      redirect_to experiences_path, notice: "Experience Added!"
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
  end

  def update
    if @experience.update experience_params
      redirect_to experience_path(@experience), notice: "Experience Updated!"
    else
      render :edit
    end
  end

  def destroy
    @experience.destroy
    redirect_to experiences_path, notice: "Experience Deleted!"
  end

  private

  def find_experience
    @experience = Experience.find params[:id]
  end

  def experience_params
    params.require(:experience).permit(:company, :title, :description, :start, :end)
  end

end
