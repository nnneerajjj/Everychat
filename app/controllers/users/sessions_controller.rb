class Users::SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(name: user_params[:name])&.authenticate(user_params[:password])
    return new_user_session_path if user
    session[:user_id] = user.id
    redirect_to root_path
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :password)
  end
end
