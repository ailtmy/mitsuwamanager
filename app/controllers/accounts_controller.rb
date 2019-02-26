class AccountsController < ApplicationController
  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    current_password ||= account_params[:current_password]

    if @user.authenticate(current_password)
      @user.update(account_params)
      redirect_to account_path(@user), notice: "#{@user.name}を更新しました。"
    else
      render :edit
    end
  end

  private

  def account_params
    params.require(:user).permit(:name, :email, :current_password, :password, :password_confirmation)
  end
end
