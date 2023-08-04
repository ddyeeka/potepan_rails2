class ReservationsController < ApplicationController

  def index
    @user = current_user
    @reservations = Reservation.all
  end

  def new
    @user = current_user
    @reservation = Reservation.new(params.require(:reservation).permit(:start_date, :end_date, :people, :room_id, :user_id, :total_price, :total_day))
    @room = Room.find(params[:reservation][:room_id])
  end

  def create
    @user = current_user
    @reservation = Reservation.new(reservation_params)
    @room = Room.find(params[:reservation][:room_id])

    if @reservation.total_day <= 0
      flash[:alert] = "終了日は開始日より後にしてください"
      redirect_to @room
    elsif @reservation.people <=0 
      flash[:alert] = "正しい人数を入力してください"
      redirect_to @room
    end

    if @reservation.save
      flash[:notice] = "予約が完了しました"
      redirect_to reservations_path(@reservation)
    else
      flash[:alert] = "予約ができませんでした"
      return
    end
  end

  def show
    @user = current_user
    @reservation = Reservation.find(params[:id])
  end

  def edit
    @rooms = Room.all
    @reservation = Reservation.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :people, :room_id, :user_id, :total_price, :total_day)
  end
  
end