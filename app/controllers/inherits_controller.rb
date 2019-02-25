class InheritsController < ApplicationController
  before_action :set_inherit, only: [:show, :edit, :update, :destroy]

  def index
    @q = Inherit.ransack(params[:q])
    @inherits = @q.result.order("projects.created_at desc").page(params[:page]).per(10)
  end

  def show
  end

  def new
    @inherit = Inherit.new
    @inherit.project_estates.build
    @inherit.project_customers.build
  end

  def edit
  end

  def create
    @inherit = Inherit.new(inherit_params)

    if @inherit.save
      redirect_to inherit_path(@inherit), notice: "#{@inherit.name}を登録しました。"
    else
      render :new
    end
  end

  def update
    if params[:inherit][:image_ids].present?
      params[:inherit][:image_ids].each do |image_id|
        image = @inherit.images.find(image_id)
        image.purge
      end
    end
    if @inherit.update(inherit_params)
      redirect_to inherit_path(@inherit), notice: "#{@inherit.name}を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    @inherit.destroy
    redirect_to inherits_path, notice: "#{@inherit.name}を削除しました。"
  end

  private

  def inherit_params
    params.require(:inherit).permit(:type, :name, :status, :application_date, :complete_date, :user_id, :request_content, :remarks, :images, project_customers_attributes: [:id, :customer_id, :project_id, :position, :equity, :_destroy],project_estates_attributes: [:id, :project_id, :estate_id, :_destroy], certificates_attributes: [:id, :project_id, :cert_kind, :number_sheet, :window, :_destroy],destinates_attributes: [:id, :project_id, :customer_id, :send_method, :send_addr, :send_date, :send_number, :receive_doc, :_destroy])
  end

  def project_customer_params
    params.require(:project_customers).permit(:customer_id, :project_id, :position, :equity)
  end

  def set_inherit
    @inherit = Inherit.find(params[:id])
  end
end