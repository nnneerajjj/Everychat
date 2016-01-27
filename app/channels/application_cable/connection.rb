module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user, :current_room

    def connect
      connection_params = verified_connection_params
      self.current_user = connection_params[:user]
      self.current_room = connection_params[:room]
      logger.add_tags current_user.name
      logger.add_tags current_room.name
    end

    def disconnected
    end

    protected

    def verified_connection_params
      if room = Room.find_by_id(cookies.signed[:room_id]) and
         user = User.find_by_id(cookies.signed[:user_id]) and
         room.participated? user

        { user: user, room: room }
      else
        reject_unauthorized_connection
      end
    end
  end
end
