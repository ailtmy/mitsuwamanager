class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @q = Project.ransack(params[:q])
    @projects = @q.result(distinct: true).page(params[:page]).per(10)
  end

  def show
    
  end

  def new
    @project = Project.new
  end

  def edit
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to @project, notice: "#{@project.name}を登録しました。"
    else
      render :new
    end
  end

  def update
    if @project.update(project_params)
      redirect_to @project, notice: "#{@project.name}を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_path, notice: "#{@project.name}を削除しました。"
  end

  private

  def project_params
    params.require(:project).permit(:name, :application_date, :place, :status)
  end

  def set_project
    @project = Project.find(params[:id])
  end

end
