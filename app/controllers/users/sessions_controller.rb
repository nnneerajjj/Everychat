class Users::SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by_name(user_params[:name]).try(:authenticate, user_params[:password])

    if @user.present?
      cookies.signed[:user_id] = {
        value:   @user.id,
        expires: 1.day.from_now
      }

      redirect_to root_path, notice: 'Signed in successfully.'
    else
      render :new
      flash[:alert] = 'Faild to sign in.'
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
