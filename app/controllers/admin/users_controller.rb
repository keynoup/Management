class Admin::UsersController < ApplicationController

  before_action :authenticate_admin!

  def index
    @users =  User.all.page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to admin_user_path
  end

  private

  def user_params
    params.require(:user).permit(:is_deleted,:email,:last_name, :first_name,
    :last_name_kana, :first_name_kana, :employee_number, :affiliation, :phone_number)
  end

end