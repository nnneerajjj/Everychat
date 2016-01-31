class Users::RegistrationsController < ApplicationController
  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to new_user_session_path
    else
      render :new
    end
  end

  def update
    # User.find(params[:id]).update(user_params)
  end

  def destroy
    # User.find(params[:id]).destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
