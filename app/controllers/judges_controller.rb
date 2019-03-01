class JudgesController < ApplicationController
  before_action :set_judge, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  private

  def mistake_params
    params.require(:judge).permit(:user_id, :control_id, :category, :project_id, :estate_id, :title, :content, :document, :opinion, :answer, :answer_control, :answer_number, :event, :cause_date, :status, :datetime, :images)
  end

  def set_judge
    @judge = Judge.find(params[:id])
  end
end
