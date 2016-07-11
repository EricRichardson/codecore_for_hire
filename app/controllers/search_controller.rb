class SearchController < ApplicationController

  def index
    @users = User.where(["first_name ILIKE ? OR last_name ILIKE ? OR concat(first_name,' ',last_name) ILIKE ?", "%#{params[:query]}%", "%#{params[:query]}%", "%#{params[:query]}%"])
  end

  def advanced_form
    @users = User.new
  end

  def advanced_search
    if params[:skills] == "" && params[:name] == ""
      flash[:alert] = "Must fill in at least one field"
      render :advanced_form
      return
    end

    if params[:skills] != ""
      skilled_profile_ids = Skill.where("name ILIKE ?", params[:skills]).pluck(:profile_id)
      skilled_user_ids = Profile.where(id: skilled_profile_ids).pluck(:user_id)
      skilled_users = User.where(id: skilled_user_ids)
    else
      skilled_users = User.all
    end
    if params[:name] != ""
      @users = skilled_users.where(["first_name ILIKE ? OR last_name ILIKE ? OR concat(first_name,' ',last_name) ILIKE ?", "%#{params[:name]}%", "%#{params[:name]}%", "%#{params[:name]}%"])
    else
      @users = skilled_users
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
