class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast "room:#{message.room.id}",
      # message: render_message(message)
      message_content: message.content,
      user_id:         message.user.id,
      user_name:       message.user.name
  end

  # private

  # def render_message(message)
  #   ApplicationController.renderer.render partial: 'messages/message',
  #     locals: { message: message }
  # end
end
