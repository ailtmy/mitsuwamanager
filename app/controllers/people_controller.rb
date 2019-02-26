class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]

  def index
    @q = Person.ransack(params[:q])
    @people = @q.result.page(params[:page]).per(10)
    @peoples = @q.result(distinct: true)

    respond_to do |format|
      format.html
      format.csv { send_data @peoples.generate_csv, filename: "people-#{Time.zone.now.strftime('%Y%m%d%S')}.csv" }
    end
  end

  def show
    @agents = CustomerAgent.where(agent_id: params[:id]).order('updated_at desc')
    @staff = BranchStaff.where(staff_id: params[:id]).order('updated_at desc')
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

  def import
    Person.import(params[:file])
    redirect_to people_path, notice: '個人顧客をファイルから追加しました。'
  end

  private

  def person_params
    params.require(:person).permit(:name, :kana, :type, :birthday, tels_attributes: [:id, :tel_kind, :tel_number, :_destroy], mails_attributes: [:id, :mail_kind, :mail_address, :_destroy])
  end

  def address_params
    params.require(:address).permit(:zip, :address, :since_date, :address_kind, :address_closure)
  end

  def set_person
    @person = Person.find(params[:id])
  end
end
