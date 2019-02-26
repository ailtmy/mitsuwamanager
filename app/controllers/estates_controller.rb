class EstatesController < ApplicationController
  def index
    @q = Estate.includes(:control).ransack(params[:q])
    @estates = @q.result.order('estates.created_at desc').page(params[:page]).per(10)
  end
end
