class GenesController < ApplicationController
  before_action :set_gene, only: [:show, :edit, :update, :destroy]

  def index
    @q = Gene.ransack(params[:q])
    @genes = @q.result.order("projects.created_at desc").page(params[:page]).per(10)  
  end

  def show
  end

  def new
    @gene = Gene.new
    @gene.project_estates.build
    @gene.project_customers.build
  end

  def edit
  end

  def create
    @gene = Gene.new(gene_params)

    if @gene.save
      redirect_to gene_path(@gene), notice: "#{@gene.name}を登録しました。"
    else 
      render :new
    end
  end

  def update
    if params[:gene][:image_ids].present?
      params[:gene][:image_ids].each do |image_id|
        image = @gene.images.find(image_id)
        image.purge
      end
    end
    if @gene.update(gene_params)
      redirect_to gene_path(@gene), notice: "#{@gene.name}を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    @gene.destroy
    redirect_to genes_path, notice: "#{@gene.name}を削除しました。"
  end

  private

  def gene_params
    params.require(:gene).permit(:type, :name, :status, :application_date, :place, :place_date, :change_name, :change_name_doc, :erasure, :erasure_confirm, :complete_date, :remarks, :tax_reduction, :tax_document, :loan, :loan_price, :loan_agree, :loan_document, :user_id, :remarks, :images, project_customers_attributes: [:id, :customer_id, :rehouse_id, :position, :equity, :_destroy], project_estates_attributes: [:id, :project_id, :estate_id, :_destroy], certificates_attributes: [:id, :project_id, :cert_kind, :number_sheet, :window, :_destroy],destinates_attributes: [:id, :project_id, :customer_id, :send_method, :send_addr, :send_date, :send_number, :receive_doc, :_destroy])
  end

  def project_customer_params
    params.require(:project_customers).permit(:customer_id, :project_id, :position, :equity)
  end

  def set_gene
    @gene = Gene.includes({project_customers: [:customer]}, {project_estates: [estate: [:control]]}, {destinates: [:customer]}).find(params[:id])
  end
end
