class UserMailer < ApplicationMailer
  def new_user_email
    @user = params[:user]

    mail(to: @user.email, subject: "created an account")
  end
end
