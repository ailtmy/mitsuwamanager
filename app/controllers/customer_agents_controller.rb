class CustomerAgentsController < ApplicationController
  before_action :set_customeragent, only: [:show, :edit, :update, :destroy]

  def index
    @customeragent = CustomerAgent.all.page(params[:page]).per(10)
  end

  def show
  end

  def new
    @customeragent = CustomerAgent.new
  end

  def edit
  end

  def create
    @customeragent = CustomerAgent.new(customeragent_params)
  
    if @customeragent.save
      redirect_to @customeragent.customer, notice: "#{@customeragent.customer.name}の代理人を登録しました。"
    else
      render :new
    end
  end

  def update
    if @customeragent.update(customeragent_params)
      redirect_to @customeragent.customer, notice: "#{@customeragent.customer.name}の代理人を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    @customeragent.destroy
    redirect_to @customeragent.customer, notice: "#{@customeragent.customer.name}の代理人を削除しました。"
  end

  private

  def customeragent_params
    params.require(:customer_agent).permit(:customer_id, :agent_id, :title)
  end

  def set_customeragent
    @customeragent = CustomerAgent.find(params[:id])
  end
end
