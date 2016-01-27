class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'room_channel'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    Message.create! do |message|
      message.content = data['message']
      message.room    = Room.find(data['room_id'])
      message.user    = current_user
    end
  end
end
