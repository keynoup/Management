class Public::EquipmentsController < ApplicationController
   before_action :authenticate_user!
   
  def show
    @equipment = Equipment.find(params[:id])
    @cart_equipment = CartEquipment.new
    @genres = Genre.all
  end
end
