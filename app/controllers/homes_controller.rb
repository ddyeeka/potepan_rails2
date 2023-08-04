class HomesController < ApplicationController

  def top
  end

  def index
      @user = current_user
      @all_rooms = Room.all
      @q = Room.ransack(params[:q])
      @results = @q.result
      @rooms = Room.search(params[:keyword])
  end

  def new
  end

  def create
  end

end
