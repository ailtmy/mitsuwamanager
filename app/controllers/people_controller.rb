class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]

  def index
    @people = Person.all
  end

  def show
  end

  def new
    @person = Person.new
  end

  def edit
  end

  def create
    @person = Person.new(person_params)

    if @person.save
      redirect_to person_path(@person), notice: "#{@person.name}を登録しました。" 
    else
      render :new
    end
  end

  def update
    if @person.update(person_params)
      redirect_to person_path(@person), notice: "#{@person.name}を更新しました。"
    else
      render :new
    end
  end

  def destroy
    @person.destroy
    redirect_to people_path, notice: "#{@person.name}を削除しました。"
  end

  private

  def person_params
    params.require(:person).permit(:name, :kana, :type, :birthday)
  end

  def set_person
    @person = Person.find(params[:id])
  end
end
