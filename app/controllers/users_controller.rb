class UsersController < ApplicationController
  def new
    return redirect_to root_path if logged_in?
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    UserMailer.with(user: @user).new_user_email.deliver_now
    session[:user_id] = @user.id
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
