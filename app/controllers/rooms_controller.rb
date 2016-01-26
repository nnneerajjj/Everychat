class RoomsController < ApplicationController
  def index
    @room = Room.new
    @rooms = Room.all
  end

  def show
    @room = Room.find(params[:id])
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
  end

  private

  def room_params
    params.require(:room).permit(:name)
  end
end
