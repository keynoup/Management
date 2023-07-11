class Admin::UserApplicationsController < ApplicationController
  def user_application_user
    @user_application = UserApplication.find_by(user_id: params[:id])

    application_status = params[:application_status]
    if params[:application_status].present?
      @user_applications = UserApplication.where(application_status: application_status).all.order(created_at: :desc).page(params[:page]).per(10)
    else
      @user_applications = UserApplication.where(user_id: params[:id]).order(created_at: :desc).page(params[:page]).per(10)
    end
  end

  def show
    @user_application = UserApplication.find(params[:id])
    @equipments = @user_application.equipments
    @details = @user_application.user_application_details

  end

  def update
    @user_application = UserApplication.find(params[:id])
    @user_application.update(application_status: params[:user_application][:application_status])
    redirect_to session.delete(:previous_url) || admin_root_path


  end
end