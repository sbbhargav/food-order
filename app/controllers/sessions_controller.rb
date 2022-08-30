class SessionsController < ApplicationController
  def new
    return redirect_to root_path if logged_in?
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user.present? and @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private

  def session_params
    params.require(:session).permit(:email, :password, :password_confirmation)
  end
end
