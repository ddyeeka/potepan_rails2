class RoomsController < ApplicationController
  before_action :ensure_user, only: [:edit, :update, :destroy]

  def index
    @rooms = Room.all
    @user = current_user
  end

  def new
    @user = current_user
    @room = Room.new
  end

  def create
    @user = current_user
    @room = Room.new(room_params)
    @room.user_id = current_user.id
    if @room.save
      flash[:notice] = "施設情報を登録しました"
      redirect_to rooms_path(@room)
    else
      flash.now[:alert] = "施設情報を登録できませんでした"
      render :new
    end
  end

  def show
    @user = current_user
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    
    if @room.update(room_params)
      flash[:notice] = "施設情報を更新しました"
      redirect_to room_path
    else
      flash.now[:alert] = "施設情報を更新できませんでした"
      render :edit
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    flash[:notice] = "施設が削除されました"
    redirect_to :rooms
  end

  def in_area
    @rooms = Room.in_area(params[:area])
  end
  
  def search
    @rooms = Room.search(params[:query])
  end
  
  def result
    @rooms = Room.all
    @rooms = @rooms.in_area(params[:area]) if params[:area].present?
    @rooms = @rooms.search(params[:query]) if params[:query].present?
    @count = @rooms.count
  end

  private

  def ensure_user
    @rooms = current_user.rooms
    @room = @rooms.find_by(id:params[:id])
    redirect_to new_room_path unless @room
  end

  def room_params
    params.require(:room).permit(:room_name, :body, :price, :address, :image)
  end


end
