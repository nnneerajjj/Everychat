module UserAuthenticatable
  extend ActiveSupport::Concern

  def current_user
    User.find(session[:user_id]) if user_signed_in?
  end

  def authenticate_user!
    unless user_signed_in?
      redirect_to new_user_session_path
      # flash[:alert]
    else
      # flash[:notice]
    end
  end

  def user_signed_in?
    session.key?(:user_id) && User.find(session[:user_id])
  end
end
