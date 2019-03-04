class JudgesController < ApplicationController
  before_action :set_judge, only: [:show, :edit, :update, :destroy]

  def index
    @q = Judge.includes(:control, :project, :user).ransack(params[:q])
    @judges = @q.result.order('judges.updated_at desc').page(params[:page]).per(10)
  end

  def show
  end

  def new
    @judge = Judge.new
    @judge.judge_estates.build
  end

  def edit
  end

  def create
    @judge = Judge.new(judge_params)

    if @judge.save
      redirect_to judge_path(@judge), notice: "#{@judge.title}を登録しました。"
    else
      render :new
    end
  end

  def update
    if params[:judge][:image_ids]
      params[:judge][:image_ids].each do |image_id|
        image = @judge.images.find(image_id)
        image.purge
      end
    end
    if @judge.update(judge_params)
      redirect_to judge_path(@judge), notice: "#{@judge.title}を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    @judge.images.purge if @judge.images.attached?
    @judge.destroy
    redirect_to judges_path, notice: "#{@judge.title}を削除しました。"
  end

  private

  def judge_params
    params.require(:judge).permit(:user_id, :control_id, :category, :project_id, :estate_id, :title, :content, :document, :opinion, :answer, :answer_control, :answer_number, :event, :cause_date, :status, :datetime, :images, judge_estates_attributes: [:id, :judge_id, :estate_id, :_destroy],)
  end

  def set_judge
    @judge = Judge.find(params[:id])
  end
end
