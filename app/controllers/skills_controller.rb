class SkillsController < ApplicationController


  def new
    @skill = Skill.new
    @user = User.find params[:user_id]
    @profile = Profile.find params[:profile_id]
  end


  def create
    @skill = Skill.new skill_params
    user = User.find params[:user_id]
    profile = user.profile
    @skill.profile = profile
    if @skill.save
      redirect_to user_profile_path(user, profile),notice:  "New Skill Created!"
    else
      flash[:alert] = "Error. Skill not created!"
      redirect_to user_profile_path(user, profile)
    end
  end



  def index
    @skills = Skill.all
  end

  def edit
    @profile = Profile.find params[:profile_id]
    redirect_to root_path, alert: "access defined" unless can? :edit, @profile
    @skill = Skill.find params[:id]
    @user = User.find params[:user_id]
  end


  def update
    @profile = Profile.find params[:profile_id]
    redirect_to root_path, alert: "access defined" unless can? :update, @profile
    user = User.find params[:user_id]
    @skill = Skill.find params[:id]
    if @skill.update skill_params
      redirect_to user_profile_path(user, @profile)
    else
      render :edit
    end
  end

  def destroy
    user User.find params[:user_id]
    @profile = Profile.find params[:profile_id]
    redirect_to root_path, alert: "access defined" unless can? :destroy, @profile
    @skill = Skill.find params[:id]
    @skill.destroy
    redirect_to user_profile_path(@profile.user,@profile)
  end


  private

  def skill_params
    skill_params = params.require(:skill).permit(:name, :rating)
  end




end
