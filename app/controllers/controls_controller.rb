class ControlsController < ApplicationController
  before_action :set_control, only: [:show, :edit, :update, :destroy
  ]
  def index
    @q = Control.ransack(params[:q])
    @controls = @q.result.order("controls.created_at asc").page(params[:page]).per(10)
    @ex_controls = @q.result(distinct: true)

    respond_to do |format|
      format.html
      format.csv { send_data @ex_controls.generate_csv, filename: "control-#{Time.zone.now.strftime('%Y%m%d%S')}.csv"}
    end
  end

  def show
  end

  def new
    @control = Control.new
    @control.addresses.build
  end

  def edit
  end

  def create
    @control = Control.new(control_params)
    @control.addresses.build(address_params)

    if @control.save
      redirect_to control_path(@control), notice: "#{@control.name}を登録しました。"
    else
      render :new
    end
  end

  def update
    if @control.update(control_params)
      redirect_to control_path(@control), notice: "#{@control.name}を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    @control.destroy
    redirect_to controls_path, notice: "#{@control.name}を削除しました。"
  end

  def import
    Control.import(params[:file])
    redirect_to controls_path, notice: "登記所をファイルから追加しました。"
  end

  def control_params
    params.require(:control).permit(:number, :name, :remark, tels_attributes:[:id, :tel_kind, :tel_number, :_destroy], mails_attributes:[:id, :mail_kind, :mail_address, :_destroy])
  end

  def address_params
    params.require(:address).permit(:zip, :address, :since_date, :address_kind, :address_closure)
  end

  def set_control
    @control = Control.find(params[:id])
  end
end
