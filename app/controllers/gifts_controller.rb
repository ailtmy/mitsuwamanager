class GiftsController < ApplicationController
  before_action :set_gift, only: [:show, :edit, :update, :destroy]

  def index
    @q = Gift.ransack(params[:q])
    @gifts = @q.result.page(params[:page]).per(10)
  end

  def show
  end

  def new
    @customer = Customer.find(params[:customer_id])
    @gift = @customer.gifts.build
  end

  def edit
  end

  def create
    @gift = Gift.new(gift_params)

    if @gift.save
      redirect_to @gift, notice: "#{@gift.customer.name}の贈答品を作成しました"
    else
      render :new
    end
  end

  def update
    if @gift.update(gift_params)
      redirect_to @gift, notice: "#{@gift.customer.name}の贈答品を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    @gift.destroy
    redirect_to gifts_path, notice: "#{@gift.customer.name}の贈答品を削除しました。"
  end

  private

  def gift_params
    params.require(:gift).permit(:customer_id, :send_receive, :gift_kind, :gift_year, :gift_address, :gift_remark)
  end

  def set_gift
    @gift = Gift.find(params[:id])
  end
end
