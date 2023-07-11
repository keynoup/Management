class Public::UsersController < ApplicationController
  
  before_action :authenticate_user!
  
  def update
    if current_user.update(user_params)
      flash[:notice] = "会員情報を更新しました"
      redirect_to user_path
    else
      render :edit
    end
  end
  
  private
    
  def user_params
    params.require(:user).permit(:is_deleted,:email,:last_name, :first_name,
    :last_name_kana, :first_name_kana, :employee_number, :affiliation, :phone_number)
  end
  
end
