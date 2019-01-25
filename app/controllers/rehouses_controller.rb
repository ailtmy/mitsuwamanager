class RehousesController < ApplicationController
  before_action :set_rehouse, only: [:show, :edit, :update, :destroy]

  def index
    @q = Rehouse.ransack(params[:q])
    @rehouses = @q.result.page(params[:page]).per(10)
  end

  def show
    
  end

  def new
    @rehouse = Rehouse.new
    @rehouse.estates.build
    @rehouse.project_customers.build
  end

  def edit
  end

  def create
    @rehouse = Rehouse.new(rehouse_params)

    if @rehouse.save
      redirect_to rehouse_path(@rehouse), notice: "#{@rehouse.name}を登録しました。"
    else 
      render :new
    end
  end

  def update
    if @rehouse.update(rehouse_params)
      redirect_to rehouse_path(@rehouse), notice: "#{@rehouse.name}を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    @rehouse.destroy
    redirec t_to rehouses_path, notice: "#{@rehouse.name}を削除しました。"
  end

  private

  def rehouse_params
    params.require(:rehouse).permit(:type, :name, :status, :application_date, :place, :place_date, :change_name, :change_name_doc, :erasure, :erasure_confirm, :complete_date, :report, :remarks, :tax_reduction, :tax_document, :loan, :loan_price, :loan_agree, :loan_document, :user_id, project_customers_attributes: [:id, :customer_id, :rehouse_id, :position, :equity, :_destroy])
  end

  def project_customer_params
    params.require(:project_customers).permit(:customer_id, :project_id, :position, :equity)
  end

  def set_rehouse
    @rehouse = Rehouse.find(params[:id])
  end
end
