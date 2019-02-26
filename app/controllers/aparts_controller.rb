class ApartsController < ApplicationController
  before_action :set_apart, only: [:show, :edit, :update, :destroy]

  def index
    @q = Apart.includes(:control).ransack(params[:q])
    @aparts = @q.result.order("estates.created_at desc").page(params[:page]).per(10)
    @ex_aparts = @q.result(distinct: true)

    respond_to do |format|
      format.html
      format.csv { send_data @ex_aparts.generate_csv, filename: "aparts-#{Time.zone.now.strftime('%Y%m%d%S')}.csv"}
    end
  end

  def show
    
  end

  def new
    @apart =  Apart.new
  end

  def edit
  end

  def create
    @apart = Apart.new(apart_params)

    if @apart.save
      redirect_to apart_path(@apart), notice: "#{@apart.apart_name}を登録しました。"
    else
      render :new
    end
  end

  def update
    if @apart.update(apart_params)
      redirect_to apart_path(@apart), notice: "#{@apart.apart_name}を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    @apart.destroy
    redirect_to aparts_path, notice: "#{@apart.apart_name}を削除しました。"
  end

  def import
    Apart.import(params[:file])
    redirect_to aparts_path, notice: "一棟の建物をファイルから追加しました。"
  end

  private

  def apart_params
    params.require(:apart).permit(:address, :apart_name, :apart_structure, :apart_area, :control_id, :type, :remarks)
  end

  def set_apart
    @apart = Apart.find(params[:id])
  end
end
