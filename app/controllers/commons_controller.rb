class CommonsController < ApplicationController
  before_action :set_common, only: [:show, :edit, :update, :destroy]

  def index
    @q = Common.ransack(params[:q])
    @commons = @q.result.order("created_at desc").page(params[:page]).per(10)
  end

  def show
  end

  def new
    @common = Common.new
    @common.project_estates.build
    @common.project_customers.build
  end

  def edit
  end

  def create
    @common = Common.new(common_params)

    if @common.save
      redirect_to common_path(@common), notice: "#{@common.name}を登録しました。"
    else
      render :new
    end
  end

  def update
    if params[:common][:image_ids].present?
      params[:common][:image_ids].each do |image_id|
        image = @common.images.find(image_id)
        image.purge
      end
    end
    if @common.update(common_params)
      redirect_to common_path(@common), notice: "#{@common.name}を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    @common.destroy
    redirect_to commons_path, notice: "#{@common.name}を削除しました。"
  end

  private

  def common_params
    params.require(:common).permit(:type, :name, :status, :application_date, :complete_date, :user_id, :request_content, :remarks, :images, project_customers_attributes: [:id, :customer_id, :project_id, :position, :equity, :_destroy],project_estates_attributes: [:id, :project_id, :estate_id, :_destroy], certificates_attributes: [:id, :project_id, :cert_kind, :number_sheet, :window, :_destroy],destinates_attributes: [:id, :project_id, :customer_id, :send_method, :send_addr, :send_date, :send_number, :receive_doc, :_destroy])
  end

  def project_customer_params
    params.require(:project_customers).permit(:customer_id, :project_id, :position, :equity)
  end

  def set_common
    @common = Common.find(params[:id])
  end
end
