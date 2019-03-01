class MistakesController < ApplicationController
  before_action :set_mistake, only: [:show, :edit, :update, :destroy]

  def index
    @q = Mistake.includes(:project).ransack(params[:q])
    @mistakes = @q.result.order('mistakes.created_at desc').page(params[:page]).per(10)
  end

  def show
  end

  def new
    @mistake = Mistake.new
  end

  def edit
  end

  def create
    @mistake = Mistake.new(mistake_params)

    if @mistake.save
      redirect_to mistake_path(@mistake), notice: "#{@mistake.title}を登録しました。"
    else
      render :new
    end
  end

  def update
    if params[:mistake][:image_ids]
      params[:mistake][:image_ids].each do |image_id|
        image = @mistake.images.find(image_id)
        image.purge
      end
    end
    if @mistake.update(mistake_params)
      redirect_to mistake_path(@mistake), notice: "#{@mistake.title}を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    @mistake.images.purge if @mistake.images.attached?
    @mistake.destroy
    redirect_to mistakes_path, notice: "#{@mistake.title}を削除しました。"
  end

  private

  def mistake_params
    params.require(:mistake).permit(:user_id, :category, :project_id, :title, :content, :date, :images)
  end

  def set_mistake
    @mistake = Mistake.find(params[:id])
  end
end
