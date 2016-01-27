class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room:#{current_room.id}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    Message.create! do |message|
      message.content = data['message']
      message.room    = current_room
      message.user    = current_user
    end
  end
end
