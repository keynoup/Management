class Admin::HomesController < ApplicationController

  before_action :authenticate_admin!

  def top
    application_status = params[:application_status]
    if params[:application_status].present?
      @user_applications = UserApplication.where(application_status: application_status).order(created_at: :desc).page(params[:page]).per(10)
    elsif !params[:equipment_id].present?
      @user_applications = UserApplication.all.order(created_at: :desc).page(params[:page]).per(10)
    else
      @user_applications = UserApplication.joins(:equipments).where(equipments: {id: params[:equipment_id]}).order(created_at: :desc).page(params[:page]).per(10)
    end
    session[:previous_url] = request.original_url
  end

  private

  def user_application_params
    params.require(:user_application).permit(:objective,:start_date,:end_date,:location,:application_status)
  end
end
