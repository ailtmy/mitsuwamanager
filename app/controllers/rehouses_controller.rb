class RehousesController < ApplicationController
  before_action :set_rehouse, only: [:show, :edit, :update, :destroy]

  def index
    @q = Rehouse.includes(:user).ransack(params[:q])
    @rehouses = @q.result.order('projects.created_at desc').page(params[:page]).per(10)
  end

  def show
  end

  def new
    @rehouse = Rehouse.new
    @rehouse.project_estates.build
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
    if params[:rehouse][:image_ids].present?
      params[:rehouse][:image_ids].each do |image_id|
        image = @rehouse.images.find(image_id)
        image.purge
      end
    end
    if @rehouse.update(rehouse_params)
      redirect_to rehouse_path(@rehouse), notice: "#{@rehouse.name}を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    @rehouse.destroy
    redirect_to rehouses_path, notice: "#{@rehouse.name}を削除しました。"
  end

  private

  def rehouse_params
    params.require(:rehouse).permit(:type, :name, :status, :application_date, :place, :place_date, :change_name, :change_name_doc, :erasure, :erasure_confirm, :complete_date, :report, :remarks, :tax_reduction, :tax_document, :loan, :loan_price, :loan_agree, :loan_document, :user_id, :remarks, :images, project_customers_attributes: [:id, :customer_id, :rehouse_id, :position, :equity, :_destroy], project_estates_attributes: [:id, :project_id, :estate_id, :_destroy], certificates_attributes: [:id, :project_id, :cert_kind, :number_sheet, :window, :_destroy], destinates_attributes: [:id, :project_id, :customer_id, :send_method, :send_addr, :send_date, :send_number, :receive_doc, :_destroy])
  end

  def project_customer_params
    params.require(:project_customers).permit(:customer_id, :project_id, :position, :equity)
  end

  def set_rehouse
    @rehouse = Rehouse.includes({ project_customers: [:customer] }, { project_estates: [estate: [:control]] }, destinates: [:customer]).find(params[:id])
  end
end
