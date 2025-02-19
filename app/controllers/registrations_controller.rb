class RegistrationsController < ApplicationController

  def new
    @user = User.new             
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id 
      redirect_to root_path, notice: "User successfully created and logged in!"
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :password_digest)
  end
end
