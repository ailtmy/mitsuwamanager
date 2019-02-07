class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]
  
  def index
    @q = Company.ransack(params[:q])
    @companies = @q.result.page(params[:page]).per(10)
    @companys = @q.result(distinct: true)

    respond_to do |format|
      format.html
      format.csv { send_data @companys.generate_csv, filename: "companies-#{Time.zone.now.strftime('%Y%m%d%S')}.csv"}
    end
  end

  def show
    @agents = CustomerAgent.where(agent_id: params[:id]).order("updated_at desc")
  end

  def new
    @company = Company.new
    @company.addresses.build
  end

  def edit
  end

  def create
    @company = Company.new(company_params)
    @company.addresses.build(address_params)

    if @company.save
      redirect_to company_path(@company), notice: "#{@company.name}を登録しました。"
    else
      render :new
    end
  end

  def update
    if @company.update(company_params)
      redirect_to company_path(@company), notice: "#{@company.name}を更新しました。"
    else
      render :edit
    end
  end
  
  def destroy
    @company.destroy
    redirect_to companies_path, notice: "#{@company.name}を削除しました。"
  end

  def import
    Company.import(params[:file])
    redirect_to companies_path, notice: '法人顧客をファイルから追加しました。'
  end

  private

  def company_params
    params.require(:company).permit(:name, :kana, :type, :establishment, :company_number, :fiscal_year, :next_application, tels_attributes:[:id, :tel_kind, :tel_number, :_destroy], mails_attributes:[:id, :mail_kind, :mail_address, :_destroy])
  end

  def address_params
    params.require(:address).permit(:zip, :address, :since_date, :address_kind, :address_closure)
  end

  def set_company
    @company = Company.find(params[:id])
  end
end
