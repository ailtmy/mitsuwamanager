class CustomersController < ApplicationController
  def index
    @q = Customer.ransack(params[:q])
    @customers = @q.result(distinct: true).page(params[:page]).per(10)
  end
end
