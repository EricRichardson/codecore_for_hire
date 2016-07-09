class SearchController < ApplicationController

  def index
    @users = User.where(["first_name ILIKE ? OR last_name ILIKE ?", "%#{params[:query]}%", "%#{params[:query]}%"])
  end

end
