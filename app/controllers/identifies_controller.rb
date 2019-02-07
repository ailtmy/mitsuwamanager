class IdentifiesController < ApplicationController
  before_action :set_identify, only: [:show, :edit, :update, :destroy, :purge]

  def index
    @q = Identify.ransack(params[:q])
    @identifies = @q.result.page(params[:page]).per(10)
  end

  def show
  end

  def new
    @customer = Customer.find(params[:customer_id])
    @identify = @customer.identifies.build
  end

  def edit
  end

  def create
    @identify = Identify.new(identify_params)

    if @identify.save
      redirect_to @identify.customer, notice: "#{@identify.customer.name}の本人確認記録を登録しました。"
    else
      render :new
    end
  end

  def update
    if params[:identify][:image_ids].present?
      params[:identify][:image_ids].each do |image_id|
        image = @identify.images.find(image_id)
        image.purge
      end
    end
    if @identify.update(identify_params)
      redirect_to @identify.customer, notice: "#{@identify.customer.name}の本人確認記録を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    @identify.images.purge if @identify.images.attached?
    @identify.destroy
    redirect_to @identify.customer, notice: "#{@identify.customer.name}の本人確認記録を削除しました。"
  end

  private

  def identify_params
    params.require(:identify).permit(:user_id, :customer_id, :ident_method, :date_time, :place, :item, :photo, :number, :issuance_date, :expiration_date, :publisher, :ident_receipt, :original_copy, :send_date, :document_receipt, :remarks, :images)
  end

  def set_identify
    @identify = Identify.find(params[:id])
  end
end
