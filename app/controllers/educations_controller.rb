class EducationsController < ApplicationController

  def index
    @educations = Education.all
  end

  def new
    @education = Education.new
  end

  def create
    @education = Education.new education_params
    if @education.save
      redirect_to educations_path, notice: "New education added!"
    else
      flash[:alert] = "Education could not be added"
      render :new
    end
  end

  def edit
    @education = Education.find(params[:id])
  end

  def update
    @education = Education.find(params[:id])
    if @education.update education_params
      redirect_to educations_path, notice: "New education updated!"
    else
      flash[:alert] = "Education not updated"
      render :edit
    end
  end

  def destroy
    education = Education.find(params[:id])
    education.destroy
    redirect_to educations_path, notice: "Education deleted"
  end

  private

  def education_params
    params.require(:education).permit(:school, :major, :description, :start, :end)
  end

end
