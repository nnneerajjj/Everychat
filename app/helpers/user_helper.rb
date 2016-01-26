module UserHelper
  def current_user
    User.find(session[:user_id]) if user_signed_in?
  end

  def user_signed_in?
    session.key?(:user_id) && User.find(session[:user_id])
  end
end
