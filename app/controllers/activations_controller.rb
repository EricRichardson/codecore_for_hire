class ActivationsController < AdministrativeController

  def index
      @users = User.where(activated: false).order(created_at: :desc).page(@page).per(10)
  end

  def update
    @activating_user = User.find params[:id]
    status = @activating_user.activated
    @activating_user.update(activated: !status)
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :activated, :for_hire, :image)
  end

end
