class Public::CartEquipmentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @cart_equipments = current_user.cart_equipments.all
  end

  def update
    cart_equipment = CartEquipment.find(params[:id])
    cart_equipment.update(params[:cart_equipment])
    redirect_to cart_equipments_path
  end

  def destroy
    cart_equipment = CartEquipment.find(params[:id])
    cart_equipment.destroy
    redirect_to cart_equipments_path
  end

  def all_destroy
    current_user.cart_equipments.destroy_all
    redirect_to cart_equipments_path
  end

  def create
    @cart_equipment = current_user.cart_equipments.new(cart_equipment_params)

    #フォームから送信された備品と同じ同じが既にカート内に存在するか
    exist_equipment = current_user.cart_equipments.find_by(equipment_id: params[:equipment_id])
    if exist_equipment.present?
      redirect_back fallback_location: root_path, notice: "既にカートに追加されています。"

    else @cart_equipment.save
    redirect_to cart_equipments_path, notice: "備品がカートに追加されました。"

    end
    
  end


private


    def cart_equipment_params
        params.permit(:equipment_id)
    end
end
