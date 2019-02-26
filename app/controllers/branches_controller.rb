class BranchesController < ApplicationController
  before_action :set_branch, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @company = Customer.find(params[:company_id])
    @branch = @company.branches.build
    @branch.addresses.build
  end

  def edit
  end

  def create
    @branch = Branch.new(branch_params)
    @branch.addresses.build(address_params)

    if @branch.save
      redirect_to company_path(@branch.company), notice: "#{@branch.branch_name}を登録しました。"
    else
      render :new
    end
  end

  def update
    if @branch.update(branch_params)
      redirect_to company_path(@branch.company), notice: "#{@branch.branch_name}を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    @branch.destroy
    redirect_to company_path(@branch.company), notice: "#{@branch.branch_name}を削除しました。"
  end

  private

  def branch_params
    params.require(:branch).permit(:customer_id, :branch_name)
  end

  def address_params
    params.require(:address).permit(:zip, :address, :since_date, :address_kind, :address_closure)
  end

  def set_branch
    @branch = Branch.includes(branch_staffs: [:staff]).find(params[:id])
  end
end
