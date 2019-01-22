class BranchStaffsController < ApplicationController
  before_action :set_branchstaff, only: [:show, :edit, :update, :destroy]

  def index
    @branchstaffs = BranchStaff.all.page(params[:page]).per(10)
  end

  def show
  end

  def new
    @branch = Branch.find(params[:branch_id])
    @branchstaff = @branch.branch_staffs.build
  end

  def edit
  end

  def create
    @branchstaff = BranchStaff.new(branchstaff_params)

    if @branchstaff.save
      redirect_to @branchstaff.branch, notice: "#{@branchstaff.staff.name}の所属を登録しました。"
    else
      render :new
    end
  end

  def update
    if @branchstaff.update(branchstaff_params)
      redirect_to @branchstaff.branch, notice: "#{@branchstaff.staff.name}の所属を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    @branchstaff.destroy
    redirect_to @branchstaff.branch, notice: "#{@branchstaff.staff.name}の所属登録を削除しました。"
  end

  private

  def branchstaff_params
    params.require(:branch_staff).permit(:branch_id, :staff_id, :title, :assigned_date)
  end

  def set_branchstaff
    @branchstaff = BranchStaff.find(params[:id])
  end
end
