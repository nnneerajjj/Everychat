class Users::SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(name: user_params[:name])&.authenticate(user_params[:password])
    if user.nil?
      redirect_to new_user_session_path
      flash[:alert] = 'Failed to sign in.'
    else
      flash[:notice] = 'Signed in successfully.'
      session[:user_id] = user.id
      redirect_to root_path
    end
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
    flash[:notice] = 'Signed out successfully.'
  end

  private

  def user_params
    params.require(:user).permit(:name, :password)
  end
end
