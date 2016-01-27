class RoomsController < ApplicationController
  before_action :authenticate_user!

  def index
    cookies.delete :room_id
    @room = Room.new
    @rooms = Room.all
  end

  def show
    cookies.signed[:room_id] = params[:id]
    @room = Room.find(params[:id])
    @messages = @room.messages.includes(:user)
  end

  def create
    if Room.create(room_params)
      flash[:notice] = 'Room was created successfully.'
    else
      flash[:alert] = 'Failed to create a room.'
    end

    redirect_to rooms_path
  end

  def update
  end

  def destroy
    if Room.find(params[:id]).destroy
      flash[:notice] = 'Room was destroyed successfully.'
    else
      flash[:alert] =  'Faild to destroy a room.'
    end

    redirect_to rooms_path
  end

  private

  def room_params
    params.require(:room).permit(:name)
  end
end
