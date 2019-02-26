class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :edit, :update, :destroy]

  def index
    @q = Room.includes(:apart).ransack(params[:q])
    @rooms = @q.result.order("estates.created_at desc").page(params[:page]).per(10)
    @ex_rooms = @q.result(distinct: true)

    respond_to do |format|
      format.html
      format.csv { send_data @ex_rooms.generate_csv, filename: "rooms-#{Time.zone.now.strftime('%Y%m%d%S')}.csv"}
    end
  end

  def show
    
  end

  def new
    @room = Room.new
    @room.build_apart_room
    @room.units.build
    @room.sites.build
    @room.prices.build
  end

  def edit
  end

  def create
    @room = Room.new(room_params)
    
    if @room.save
      redirect_to room_path(@room), notice: "#{@room.apart_name}を登録しました。"
    else
      render :new
    end
  end

  def update
    if @room.update(room_params)
      redirect_to room_path(@room), notice: "#{@room.apart_name}を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    @room.destroy
    redirect_to rooms_path, notice: "#{@room.apart_name}を削除しました。"
  end

  def import
    Room.import(params[:file])
    redirect_to rooms_path, notice: "専有部分の建物をファイルから追加しました。"
  end

  private

  def room_params
    params.require(:room).permit(:estate_number, :number, :apart_name, :estate_kind, :structure, :area, :type, :remarks, apart_room_attributes: [:id, :apart_id, :room_id], units_attributes: [:id, :type, :sign, :estate_kind, :structure, :area, :_destroy], estate_units_attributes: [:id, :estate_id, :unit_id, :_destroy], sites_attributes: [:id, :land_id, :room_id, :land_kind, :land_percent, :sign,:_destroy],prices_attributes: [:id, :year, :price, :estate_id, :price_kind, :remarks, :_destroy])
  end

  def set_room
    @room = Room.find(params[:id])
  end
end
