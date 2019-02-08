class EstatesController < ApplicationController
  def index
    @q = Estate.ransack(params[:q])
    @estates = @q.result.page(params[:page]).per(10)
  end
end
