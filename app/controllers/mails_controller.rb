class MailsController < ApplicationController
  before_action :set_mail, only: [:edit, :update, :destroy]

  def new
    @customer = Customer.find(params[:customer_id])
    @mail = @customer.mails.build
  end

  def edit

  end

  def create
    @mail = Mail.new(mail_params)

    if @mail.save
      redirect_to @mail.mailable, notice: "#{@mail.mail_address}を登録しました。"
    else
      render :new
    end
  end

  def update
    if @mail.update(mail_params)
      redirect_to @mail.mailable, notice: "#{@mail.mail_address}を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    @mail.destroy
    redirect_to @mail.mailable, notice: "#{@mail.mail_address}を削除しました。"
  end

  private

  def mail_params
    params.require(:mail).permit(:mailable_type, :mailable_id, :mail_address, :mail_kind)
  end

  def set_mail
    @mail = Mail.find(params[:id])
  end


end
