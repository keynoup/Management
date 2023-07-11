class Public::HomesController < ApplicationController
  
   before_action :authenticate_user!
  
  def top
    if params[:genre_id].present?
      @equipments = Equipment.where(genre_id: params[:genre_id]).page(params[:page]).per(10)
      @genre = Genre.find(params[:genre_id])
      @genre_count = @genre.equipments.count
    else
      @equipments = Equipment.all.page(params[:page]).per(10)
      @equipment_count = @equipments.total_count
    end

    @genres = Genre.all
  end
end
