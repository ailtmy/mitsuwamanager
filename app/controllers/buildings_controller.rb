class BuildingsController < ApplicationController
  before_action :set_building, only: [:show, :edit, :update, :destroy]

  def index
    @q = Building.includes(:control).ransack(params[:q])
    @buildings = @q.result.order("estates.created_at desc").page(params[:page]).per(10)
    @ex_building = @q.result(distinct: true)

    respond_to do |format|
      format.html
      format.csv { send_data @ex_building.generate_csv, filename: "buildings-#{Time.zone.now.strftime('%Y%m%d%S')}.csv"}
    end
  end

  def show
  end

  def new
    @building = Building.new
    @building.prices.build
    # @building.units.build
  end

  def edit
    
  end

  def create
    @building = Building.new(building_params) 

    if @building.save
      redirect_to building_path(@building), notice: "#{@building.address}#{@building. number}を登録しました。" 
    else
      render :new
    end
  end

  def update
    if @building.update(building_params)
      redirect_to building_path(@building), notice: "#{@building.address}#{@building.number}を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    @building.destroy
    redirect_to buildings_path, notice: "#{@building.address}#{@building.number}を削除しました。"
  end

  def import
    Building.import(params[:file])
    redirect_to buildings_path, notice: "建物をファイルから追加しました。"
  end

  private

  def building_params
    params.require(:building).permit(:estate_number, :address, :number, :estate_kind, :structure, :area, :remarks, :control_id, :type, prices_attributes: [:id, :year, :price, :estate_id, :price_kind, :remarks, :_destroy], units_attributes: [:id, :type, :sign, :estate_kind, :structure, :area, :_destroy])
  end

  def set_building
    @building = Building.find(params[:id])
  end

end
