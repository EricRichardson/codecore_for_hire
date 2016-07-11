class HomeController < ApplicationController

  def index
    @sign_up_url = new_user_path
    @for_hire_url = users_path + '/?hire?=true'
  end

end
