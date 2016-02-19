class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast "room:#{message.room.id}",
      message_content: message.content,
      user_id:         message.user.id,
      user_name:       message.user.name
  end
end
