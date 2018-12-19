class Admin::Base < ApplicationController
#管理者権限がない場合は見せない
  before_action :admin_login_required

#管理者権限がない場合はアクセスさせない
  private def admin_login_required
  # --------------------------
  # 最終的にエラーページを見せる
  # --------------------------
    redirect_to root_path unless current_user&.admin?            
  end
end