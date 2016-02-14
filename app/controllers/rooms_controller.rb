class RoomsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_room, only: %i(show update destroy enter)
  before_action :restrict_access!, only: %i(show update destroy)

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
    room = Room.new(room_params)
    if room.save
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
    redirect_to @room and return if @room.participated? current_user
    @room.participate! current_user
    redirect_to @room # , notice: 'You participated successfully.'
  end

  private

  def set_room
    @room = Room.find(params[:id])
  end

  def room_params
    params.require(:room).permit(:name)
  end

  def restrict_access!
    unless @room.participated? current_user
      redirect_to rooms_path, alert: 'You have to participate in the room.'
    end
  end
end
