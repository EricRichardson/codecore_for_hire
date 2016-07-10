class DescriptionsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user
  before_action :find_profile
  before_action :find_description, only: [:edit, :update, :destroy]
  def new
    @description = Description.new
  end

  def create
    @description = Description.new description_params
    @description.profile = @profile
    @profile.description = @description
    if @description.save
      redirect_to user_profile_path(@user, @profile), notice: "Description created"
    else
      flash[:alert] = "cloudn't create description"
      render :new
    end
  end


  def edit
    redirect_to root_path, alert: "access defined" unless can? :edit, @profile
  end

  def update
    redirect_to root_path, alert: "access defined" unless can? :update, @profile
    if @description.update description_params
      redirect_to user_profile_path(@user, @profile), notice: "New description updated!"
    else
      flash[:alert] = "Description not updated"
      render :edit
    end
  end

  def destroy
    redirect_to root_path alert: "access defined" unless can? :destroy, @profile
    @description.destroy
    redirect_to user_profile_path(@user, @profile), notice: "Description deleted"
  end

private
  def description_params
    params.require(:description).permit(:body)
  end

  def find_description
    @description = Description.find(params[:id])
  end
end
