class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    Message.create(message_params)
  end

  private

  def message_params
    params
      .require(:message)
      .permit(:content)
      .merge(room: Room.find(params[:id]), user: current_user)
  end
end
