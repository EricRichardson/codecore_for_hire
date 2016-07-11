class SearchController < ApplicationController

  def index
    @users = User.where(["first_name ILIKE ? OR last_name ILIKE ? OR concat(first_name,' ',last_name) ILIKE ?", "%#{params[:query]}%", "%#{params[:query]}%", "%#{params[:query]}%"])
  end

  def advanced_form
    @users = User.new
  end

  def advanced_search
    if params[:skills] == "" && params[:name] == "" && params[:school] == ""
      flash[:alert] = "Must fill in at least one field"
      render :advanced_form
      return
    end

    if params[:skills] != ""
      skills = params[:skills].split(',')
      matching_skills = Skill.where("name ILIKE ANY (array[?])", skills).pluck(:profile_id)

      # if a value in skilled_profile_ids appears skills.length times, keep it, else remove
      skills_count = Hash.new(0)
      matching_skills.each do |id|
        skills_count[id] += 1
      end
      skilled_profile_ids = []
      skills_count.each do |key,value|
        if value == skills.length
          skilled_profile_ids << key
        end
      end

      skilled_user_ids = Profile.where(id: skilled_profile_ids).pluck(:user_id)

      skilled_users = User.where(id: skilled_user_ids)
    else
      skilled_users = User.all
    end

    if params[:school] != ""
      education_profile_ids = Education.where("school ILIKE ?", params[:school]).pluck(:profile_id)
      education_user_ids = Profile.where(id: education_profile_ids).pluck(:user_id)

      education_users = skilled_users.where(id: education_user_ids)
    else
      education_users = skilled_users
    end

    if params[:name] != ""
      @users = education_users.where(["first_name ILIKE ? OR last_name ILIKE ? OR concat(first_name,' ',last_name) ILIKE ?", "%#{params[:name]}%", "%#{params[:name]}%", "%#{params[:name]}%"])
    else
      @users = education_users
    end

    render :index

  end

  # def advanced_search
  #   if params[:skills]
  #     skillset = params[:skills]
  #     user_skills =
  #   end
  #   if params[:name]
  #     name = params[:name]
  #     user_name =
  #   end
  #   @user = join user
  #   @users = User.where(["(first_name ILIKE ? OR last_name ILIKE ? OR concat(first_name,' ',last_name) ILIKE ?)", "%#{name}%", "%#{name}%", "%#{name}%"])
  #   render :index
  # end

  # def advanced_search
  #   if params[:skills]
  #     skillset = params[:skills]
  #   end
  #   if params[:name]
  #     name = params[:name]
  #   end
  #   @users = User.where(["(first_name ILIKE ? OR last_name ILIKE ? OR concat(first_name,' ',last_name) ILIKE ?) AND (name FROM skills ILIKE ?)", "%#{name}%", "%#{name}%", "%#{name}%", "%#{skillset}%"])
  #   render :index
  # end

end
