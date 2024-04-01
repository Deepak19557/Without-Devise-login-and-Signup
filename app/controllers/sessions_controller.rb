class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "User successfully logged in!"
    else
      redirect_to new_session_path, notice: "Invalid Credentials."
    end
  end

  def session_destroy
    session[:user_id] = nil
    redirect_to new_registration_path
  end

end
