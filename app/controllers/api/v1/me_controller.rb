class Api::V1::MeController < Api::V1::ApplicationController
  before_action :ensure_access_token

  # GET /me
  def index
    render :me
  end

  #PATCH /me
  def update
    @current_user.update_attributes me_params
    render :me
  end

private
  def me_params
    params.require(:me).permit(:display_name)
  end
end
