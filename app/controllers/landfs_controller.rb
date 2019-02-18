class LandfsController < ApplicationController
  before_action :set_landf, only: [:show, :edit, :update, :destroy]

  def index
    @q = Landf.ransack(params[:q])
    @landfs = @q.result.page(params[:page]).per(10)
  end

  def show
  end

  def new
    @landf = Landf.new
    @landf.project_estates.build
    @landf.project_customers.build
  end

  def edit
  end

  def create
    @landf = Landf.new(landf_params)

    if @landf.save
      redirect_to landf_path(@landf), notice: "#{@landf.name}を登録しました。"
    else
      render :new
    end
  end

  def update
    if @landf.update(landf_params)
      redirect_to landf_path(@landf), notice: "#{@landf.name}を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    @landf.destroy
    redirect_to landfs_path, notice: "#{@landf.name}を削除しました。"
  end

  private

  def landf_params
    params.require(:landf).permit(:type, :name, :status, :application_date, :place, :place_date, :loan_price, :loan_agree, :loan_document, :change_name, :change_name_doc, :erasure, :erasure_confirm, :complete_date, :user_id, :remarks, project_customers_attributes: [:id, :customer_id, :project_id, :position, :equity, :_destroy],project_estates_attributes: [:id, :project_id, :estate_id, :_destroy], certificates_attributes: [:id, :project_id, :cert_kind, :number_sheet, :window, :_destroy])
  end

  def project_customer_params
    params.require(:project_customers).permit(:customer_id, :project_id, :position, :equity)
  end

  def set_landf
    @landf = Landf.find(params[:id])
  end
end
