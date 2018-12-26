class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]
  
  def index
    @q = Company.ransack(params[:q])
    @companies = @q.result(distinct: true)
  end

  def show
  end

  def new
    @company = Company.new
  end

  def edit
  end

  def create
    @company = Company.new(company_params)

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
      render :new
    end
  end
  
  def destroy
    @company.destroy
    redirect_to companies_path, notice: "#{@company.name}を削除しました。"
  end

  private

  def company_params
    params.require(:company).permit(:name, :kana, :type, :establishment, :company_number, :fiscal_year, :next_application)
  end

  def set_company
    @company = Company.find(params[:id])
  end
end
