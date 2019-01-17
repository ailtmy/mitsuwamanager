class AgentsController < ApplicationController
  before_action :set_agent, only: [:show, :edit, :update, :destroy]

  def index
    @q = Agent.ransack(params[:q])
    @agents = @q.result(distinct: true).page(params[:page]).per(10)
  end

  def show
  end

  def new
    @agent = Agent.new
    @agent.addresses.build
    @customer_agent = @agent.customer_agents.build
  end

  def edit
    
  end

  def create
    @agent = Agent.new(agent_params)
    @agent.addresses.build(address_params)

    if @agent.save
      redirect_to agents_path, notice: "#{@agent.name}を登録しました。"
    else
      render :new
    end
  end

  def update
    if @agent.update(agent_params)
      redirect_to @agent, notice: "#{@agent.name}を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    @agent.destroy
    redirect_to agents_path, notice: "#{@agent.name}を削除しました。"
  end

  private

  def agent_params
    params.require(:agent).permit(:name, :kana, :type, :birthday, customer_agents_attributes: [:id, :customer_id, :agent_id, :title, :_destroy])
  end

  def address_params
    params.require(:address).permit(:zip, :address, :since_date)
  end

  def set_agent
    @agent = Agent.find(params[:id])
  end
end
