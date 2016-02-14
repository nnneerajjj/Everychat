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
      cookies.signed[:user_id] = {
        value:   @user.id,
        expires: 1.day.from_now
      }

      redirect_to rooms_path, notice: 'Create user successfully.'
    else
      flash[:alert] = 'Faild to create user.'
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
