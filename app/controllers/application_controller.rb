class ApplicationController < ActionController::Base
  helper_method :current_user, :current_cart
  
  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def logged_in?
    !!current_user
  end
  
  def authenticated
    redirect_to new_session_path unless logged_in?
  end

  def current_cart
    @cart ||= Cart.find(session[:cart_id]) if session[:cart_id]
  end
end
