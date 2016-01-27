class RoomsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_room, :restrict_access!, only: %i(show update destroy enter)

  def index
    cookies.delete :room_id
    @room = Room.new
    @rooms = Room.all
  end

  def show
    cookies.signed[:room_id] = params[:id]
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
    if @room.destroy
      flash[:notice] = 'Room was destroyed successfully.'
    else
      flash[:alert] =  'Faild to destroy a room.'
    end

    redirect_to rooms_path
  end

  def enter
    @room.participate! current_user
    redirect_to @room
    flash[:notice] = 'You participated successfully.'
  end

  private

  def set_room
    @room = Room.find(params[:id])
  end

  def room_params
    params.require(:room).permit(:name)
  end

  def restrict_access!
    @room.participated? current_user
  end
end
