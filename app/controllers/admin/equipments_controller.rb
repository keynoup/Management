class Admin::EquipmentsController < ApplicationController

 before_action :authenticate_admin!

  def index
    @equipments = Equipment.all.page(params[:page]).per(10)
  end

  def new
    @equipment = Equipment.new
  end

  def show
    @equipment = Equipment.find(params[:id])
  end

  def edit
    @equipment = Equipment.find(params[:id])
  end

  def create
    equipment = Equipment.new(equipment_params)

    if equipment.save
      redirect_to admin_equipment_path(equipment.id)
    else
      render :new 
    end
  end

  def update
    equipment = Equipment.find(params[:id])
    equipment.update(equipment_update_params)

    #equipmentのeditで備品ステータス変更する場合のみ適応
    begin
      user_application = UserApplication.find(params[:user_application_id])
    rescue ActiveRecord::RecordNotFound
      redirect_to admin_equipment_path(equipment)
    return
    end

    #user_applicationのshowで備品ステータスを変更する場合のみ適応
    user_application = UserApplication.find(params[:user_application_id])
    # 全てのステータスが使用中でなくなればapplication_statusを返却確認済みに変更する
    if user_application.equipments.none? { |eq| eq.during_use? }
      user_application.returned!
    end

    redirect_to admin_user_application_path(user_application)
  end


  private

  def equipment_params
    params.require(:equipment).permit(:genre_id, :equipment_name, :management_number,
    :equipment_remarks, :equipment_status, :administrator, :image)
  end

  def equipment_update_params
    params.require(:equipment).permit(:equipment_status)
  end

end