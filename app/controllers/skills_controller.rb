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
    @skill = Skill.find params[:id]
  end


  def update
    @skill = Skill.find params[:id]
    if @skill.update skill_params
      redirect_to skill_path(@skill)
    else
      render :edit
    end
  end

  def destroy
    @skill = Skill.find params[:id]
    @skill.destroy
    redirect_to skills_path
  end


  private

  def skill_params
    skill_params = params.require(:skill).permit(:name, :rating)
  end




end
