class Public::UserApplicationsController < ApplicationController

   before_action :authenticate_user!

  def new
     @user_application = UserApplication.new
  end

  def confirm
  @user_application = UserApplication.new(user_application_params)
  @user_application.user_id = current_user.id
  @cart_equipments = current_user.cart_equipments.all
  end

  def create
   # 申請情報の作成と保存
  @user_application = UserApplication.new(user_application_params)
  
  @cart_equipments = current_user.cart_equipments.all

  if @user_application.save
    # 備品のステータスを変更する処理
    @cart_equipments.each do |f|
      @user_application.user_application_details.create!(equipment_id: f.equipment_id)
      #UserApplicationDetail.create!(user_application_id: @user_application.id, equipment_id: f.equipment_id)
      f.equipment.update(equipment_status: 'during_use')
    end
    # 成功時のリダイレクトなどの処理
    redirect_to root_path, notice: '申請が確定されました。'
  else
    # エラー時の処理
    render :new
  end
    # カート内備品を全削除
    current_user.cart_equipments.destroy_all

  end

  def index
    @user_applications = current_user.user_applications.all.page(params[:page]).order(created_at: :desc)

  end

  def use_list
    @user_applications = current_user.user_applications.all.where(application_status: 1).page(params[:page]).order(created_at: :desc)
  end

  def show
    @user_application = UserApplication.find(params[:id])

    @details = @user_application.user_application_details
    @equipments = @user_application.equipments
  end

  def user_application_params
     params.require(:user_application).permit(:user_id, :objective, :start_date,:end_date,
     :return_date, :location, :application_status, :application_remarks)
  end

end