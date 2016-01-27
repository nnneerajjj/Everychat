module UserAuthenticatable
  extend ActiveSupport::Concern

  included do
    helper_method :current_user, :user_signed_in?
  end

  def current_user
    User.find(cookies.signed[:user_id]) if user_signed_in?
  end

  def user_signed_in?
    cookies.signed[:user_id].present? && User.find(cookies.signed[:user_id])
  end

  def authenticate_user!
    unless user_signed_in?
      redirect_to new_user_session_path
      flash[:alert] = 'You need to sign in or sign up before continuing.'
    end
  end
end
