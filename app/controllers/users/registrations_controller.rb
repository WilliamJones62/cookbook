class Users::RegistrationsController < Devise::RegistrationsController
  skip_before_action :require_no_authentication, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
     if @user.save
       redirect_to root_path
     else
       render :new
     end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :avatar, :admin, :first_name, :last_name, :image)
  end
end
