class AddressesController < ApplicationController
  before_action :set_address, only: [:edit, :update, :destroy]

  def index
    @addresses = Address.all
  end

  def show
  end

  def new
    @customer = Customer.find(params[:customer_id])
    @address = @customer.addresses.build
  end

  def addaddr
    @control = Control.find(params[:control_id])
    @address = @control.addresses.build
    render :new
  end

  def edit
  end

  def create
    @address = Address.new(address_params)

    if @address.save
      redirect_to @address.addressable, notice: "#{@address.address}を登録しました。"
    else
      render :new
    end
  end

  def update
    if @address.update(address_params)
      redirect_to @address.addressable, notice: "#{@address.address}を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    @address.destroy
    redirect_to customers_path, notice: "#{@address.address}を削除しました。"
  end

  private

  def address_params
    params.require(:address).permit(:addressable_type, :addressable_id, :zip, :address, :since_date, :address_kind, :address_closure)
  end

  def set_address
    @address = Address.find(params[:id])
  end
end
