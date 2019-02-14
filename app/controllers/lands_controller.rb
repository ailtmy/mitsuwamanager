class LandsController < ApplicationController
  before_action :set_land, only: [:show, :edit, :update, :destroy]

  def index
    @q = Land.ransack(params[:q])
    @lands = @q.result.page(params[:page]).per(10)
    @ex_land = @q.result(distinct: true)

    respond_to do |format|
      format.html
      format.csv { send_data @ex_land.generate_csv, filename: "lands-#{Time.zone.now.strftime('%Y%m%d%S')}.csv"}
    end
  end

  def show
  end

  def new
    @land = Land.new
    @land.prices.build
  end

  def edit
  end

  def create
    @land = Land.new(land_params) 

    if @land.save
      redirect_to land_path(@land), notice: "#{@land.address}#{@land. number}を登録しました。"      
    else
      render :new
    end
  end

  def update
    if @land.update(land_params)
      redirect_to land_path(@land), notice: "#{@land.address}#{@land.number}を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    @land.destroy
    redirect_to lands_path, notice: "#{@land.address}#{@land.number}を削除しました。"
  end

  def import
    Land.import(params[:file])
    redirect_to lands_path, notice: "土地をファイルから追加しました。"
  end

  private

  def land_params
    params.require(:land).permit(:estate_number, :address, :number, :estate_kind, :area, :remarks, :control_id, :type, prices_attributes: [:id, :year, :price, :estate_id, :price_kind, :remarks, :_destroy])
  end

  def set_land
    @land = Land.find(params[:id])
  end
end
