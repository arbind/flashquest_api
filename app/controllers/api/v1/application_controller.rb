class Api::V1::ApplicationController < ApplicationController
  layout 'api_v1'
  protect_from_forgery with: :null_session

  def ensure_access_token
    return @current_user if @current_user

    token = request.headers[:access_token]
    device = Device.find_by_access_token token
    raise Exception::Unauthorized if device.nil?
    @current_user = device.person
    raise Exception::Unauthorized if @current_user.nil?
  end

end
