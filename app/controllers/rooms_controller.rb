class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      flash[:notice] = "施設情報を登録しました"
      redirect_to rooms_path
    else
      flash.now[:alert] = "施設情報を登録できませんでした"
      render :new
    end
  end

  def show
    @room = Room.find(params[:id])
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

  private
  
  def room_params
    params.require(:room).permit(:room_name, :body, :price, :address, :image)
  end
end
