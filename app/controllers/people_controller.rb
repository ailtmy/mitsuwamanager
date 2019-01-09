class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]

  def index
    @q = Person.ransack(params[:q])
    @people = @q.result(distinct: true).page(params[:page]).per(10)
  end

  def show
    
  end

  def new
    @person = Person.new
    @person.addresses.build
  end

  def edit
    
  end

  def create
    @person = Person.new(person_params)
    @person.addresses.build(address_params)

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
      render :edit
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

  def address_params
    params.require(:address).permit(:zip, :address, :since_date)
  end

  def set_person
    @person = Person.find(params[:id])
  end
end
