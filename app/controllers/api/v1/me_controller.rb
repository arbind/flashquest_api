class Api::V1::MeController < Api::V1::ApplicationController
  before_action :ensure_access_token

  # GET /me
  def index
  end

end
