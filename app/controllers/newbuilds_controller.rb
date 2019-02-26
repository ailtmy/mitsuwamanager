class NewbuildsController < ApplicationController
  before_action :set_newbuild, only: [:show, :edit, :update, :destroy]

  def index
    @q = Newbuild.ransack(params[:q])
    @newbuilds = @q.result.order('projects.created_at desc').page(params[:page]).per(10)
  end

  def show
  end

  def new
    @newbuild = Newbuild.new
    @newbuild.project_estates.build
    @newbuild.project_customers.build
  end

  def edit
  end

  def create
    @newbuild = Newbuild.new(newbuild_params)

    if @newbuild.save
      redirect_to newbuild_path(@newbuild), notice: "#{@newbuild.name}を登録しました。"
    else
      render :new
    end
  end

  def update
    if params[:newbuild][:image_ids].present?
      params[:newbuild][:image_ids].each do |image_id|
        image = @newbuild.images.find(image_id)
        image.purge
      end
    end
    if @newbuild.update(newbuild_params)
      redirect_to newbuild_path(@newbuild), notice: "#{@newbuild.name}を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    @newbuild.destroy
    redirect_to newbuilds_path, notice: "#{@newbuild.name}を削除しました。"
  end

  private

  def newbuild_params
    params.require(:newbuild).permit(:type, :name, :status, :application_date, :complete_date, :user_id, :request_content, :remarks, :images, project_customers_attributes: [:id, :customer_id, :project_id, :position, :equity, :_destroy], project_estates_attributes: [:id, :project_id, :estate_id, :_destroy], certificates_attributes: [:id, :project_id, :cert_kind, :number_sheet, :window, :_destroy], destinates_attributes: [:id, :project_id, :customer_id, :send_method, :send_addr, :send_date, :send_number, :receive_doc, :_destroy])
  end

  def project_customer_params
    params.require(:project_customers).permit(:customer_id, :project_id, :position, :equity)
  end

  def set_newbuild
    @newbuild = Newbuild.includes({ project_customers: [:customer] }, { project_estates: [estate: [:control]] }, { destinates: [:customer] }).find(params[:id])
  end
end
