class SkillsController < ApplicationController


  def new
    @skill = Skill.new
  end


  def create
    @skill = Skill.new skill_params

    if @skill.save
      render "/skills/index"
      flash[:notice] = "New Skill Created!"
    else
      flash[:alert] = "Error. Skill not created!"
      render "/skills/new"
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
