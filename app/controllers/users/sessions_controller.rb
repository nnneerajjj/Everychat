class Users::SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(name: user_params[:name]).try(:authenticate, user_params[:password])

    if user.nil?
      redirect_to new_user_session_path, alert: 'Failed to sign in.'
    else
      cookies.signed[:user_id] = {
        value:      user.id,
        expires: 1.day.from_now
      }

      redirect_to root_path, notice: 'Signed in successfully.'
    end
  end

  def destroy
    cookies.delete :user_id
    redirect_to root_path, notice: 'Signed out successfully.'
  end

  private

  def user_params
    params.require(:user).permit(:name, :password)
  end
end
