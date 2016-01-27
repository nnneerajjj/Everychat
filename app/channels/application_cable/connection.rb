module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = User.find(cookies.signed[:user_id])
      logger.add_tags current_user.name
    end

    def disconnected
    end
  end
end
