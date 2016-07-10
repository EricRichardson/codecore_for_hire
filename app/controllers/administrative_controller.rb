class AdministrativeController < ApplicationController
  before_action :authenticate_admin!

  private

  def authenticate_admin!
    if !is_admin?
      redirect_to root_path, alert: "Access Denied!"
    end
  end

  def is_admin?
    current_user.admin
  end

end
