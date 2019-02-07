class TelsController < ApplicationController
  before_action :set_tel, only: [:edit, :update, :destroy]

  def new
    @customer = Customer.find(params[:customer_id])
    @tel = @customer.tels.build
  end

  def edit
  end

  def create
    @tel = Tel.new(tel_params)

    if @tel.save
      redirect_to @tel.telable, notice: "#{@tel.tel_number}を登録しました。"
    else
      render :new
    end
  end

  def update
    if @tel.update(tel_params)
      redirect_to @tel.telable, notice: "#{@tel.tel_number}を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    @tel.destroy
    redirect_to @tel.telable, notice: "#{@tel.tel_number}を削除しました。"
  end

  private

  def tel_params
    params.require(:tel).permit(:telable_type, :telable_id, :tel_number, :tel_kind)
  end

  def set_tel
    @tel = Tel.find(params[:id])
  end
end
