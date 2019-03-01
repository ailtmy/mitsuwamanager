class CostsController < ApplicationController
  before_action :set_cost, only: [:show, :edit, :update, :destroy]

  def index
    @project = Project.find(params[:project_id])
    @costs = @project.costs.includes(:project)
  end

  def show

  end

  def new
    @project = Project.find(params[:project_id])
    @cost = @project.costs.build
  end

  def edit
  end

  def create
    @cost = Cost.new(cost_params)

    if @cost.save
      redirect_to @cost.project, notice: "#{@cost.project.name}に経費を登録しました。"
    else
      render :new
    end
  end

  def update
    if @cost.update(cost_params)
      redirect_to @cost.project, notice: "#{@cost.project.name}の経費を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    @cost.destroy
    redirect_to @cost.project, notice: "#{@cost.project.name}の経費を削除しました。"
  end

  private

  def cost_params
    params.require(:cost).permit(:project_id, :date, :category, :pay_org, :pay)
  end

  def set_cost
    @cost = Cost.find(params[:id])
  end
end
