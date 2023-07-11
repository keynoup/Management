class Public::UserApplicationDetailsController < ApplicationController

  def edit
    @user_application = UserApplication.find(params[:user_application])
    @equipment = Equipment.find(params[:equipment])
    @detail = UserApplicationDetail.find_by(equipment_id: @equipment.id, user_application_id:  @user_application.id)
  end

  def update
    detail = UserApplicationDetail.find(params[:id])
    detail.user_application.update(application_status: 2)

    if detail.update(detail_params)
      redirect_to user_application_path(detail.user_application_id)
    else
      flash[:alert] = "送信に失敗しました。入力内容を確認してください。"
      render :edit
    end
  end

  private

  def detail_params
      params.require(:user_application_detail).permit(:administrator,:return_remarks, :image)
  end
end