class CasefilesController < ApplicationController
  before_action :set_casefile, only: [:show, :edit, :update, :destroy]

  def index
    @q = Casefile.includes({customer_casefiles: [:customer]}, :project).ransack(params[:q])
    @casefiles = @q.result.order("casefiles.date desc").page(params[:page]).per(10)
    @casefile = @q.result

    respond_to do |format|
      format.html
      format.csv { send_data @casefile.generate_csv, filename: "casefile-#{Time.zone.now.strftime('%Y%m%d%S')}.csv"}
    end
  end

  def get_report
    @q = Casefile.ransack(params[:q])
    @casefile = @q.result.group(:kind, :count)
  end

  def show
  end

  def new
    @casefile = Casefile.new
    @customer_casefile = @casefile.customer_casefiles.build
  end

  def edit
  end

  def create
    @casefile = Casefile.new(casefile_params)
  
    if @casefile.save
      redirect_to casefile_path(@casefile), notice: "#{@casefile.id}を登録しました。"
    else
      render :new
    end
  end

  def update
    if @casefile.update(casefile_params)
      redirect_to @casefile, notice: "#{@casefile.id}を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    @casefile.destroy
    redirect_to casefiles_path, notice: "#{@casefile.id}を削除しました。"
  end

  def import
    Casefile.import(params[:file])
    redirect_to casefiles_path, notice: '事件簿をファイルから追加しました。'
  end

  private

  def casefile_params
    params.require(:casefile).permit(:year, :number, :date, :event_title, :event_number, :count, :kind, :project_id, customer_casefiles_attributes: [:id, :customer_id, :casefile_id, :applicant, :_destroy])
  end

  def set_casefile
    @casefile = Casefile.includes(customer_casefiles: [:customer]).find(params[:id])
  end
end
