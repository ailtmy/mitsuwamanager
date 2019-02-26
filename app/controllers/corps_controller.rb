class CorpsController < ApplicationController
  before_action :set_corp, only: [:show, :edit, :update, :destroy]

  def index
    @q = Corp.ransack(params[:q])
    @corps = @q.result.order("projects.created_at desc").page(params[:page]).per(10)
  end

  def show
  end

  def new
    @corp = Corp.new
    @corp.project_customers.build
  end

  def edit
  end

  def create
    @corp = Corp.new(corp_params)

    if @corp.save
      redirect_to corp_path(@corp), notice: "#{@corp.name}を登録しました。"
    else
      render :new
    end
  end

  def update
    if params[:corp][:image_ids].present?
      params[:corp][:image_ids].each do |image_id|
        image = @corp.images.find(image_id)
        image.purge
      end
    end
    if @corp.update(corp_params)
      redirect_to corp_path(@corp), notice: "#{@corp.name}を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    @corp.destroy
    redirect_to corps_path, notice: "#{@corp.name}を削除しました。"
  end

  private

  def corp_params
    params.require(:corp).permit(:type, :name, :status, :application_date, :complete_date, :user_id, :request_content, :remarks, :images, project_customers_attributes: [:id, :customer_id, :project_id, :position, :equity, :_destroy], certificates_attributes: [:id, :project_id, :cert_kind, :number_sheet, :window, :_destroy], destinates_attributes: [:id, :project_id, :customer_id, :send_method, :send_addr, :send_date, :send_number, :receive_doc, :_destroy])
  end

  def project_customer_params
    params.require(:project_customers).permit(:customer_id, :project_id, :position, :equity)
  end

  def set_corp
    @corp = Corp.includes({project_customers: [:customer]}, {customers: [:company_controls]}, {destinates: [:customer]}).find(params[:id])
  end
end
