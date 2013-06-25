class Api::V1::ApplicationController < ApplicationController
  layout 'api_v1'
  protect_from_forgery with: :null_session
  rescue_from Exception, :with => :render_exception

  def render_exception(exception)
    @error = exception.message
    if exception.kind_of? Api::V1::Error::ApiException
      response.status = exception.code
    else
      response.status = 404
    end
    render template: "api/v1/error"
  end

  def ensure_access_token
    return @current_user if @current_user
    device = Device.where(access_token_params).first
    @current_user = device.person
    raise Api::V1::Error::Unauthorized if @current_user.nil?
  rescue
    raise Api::V1::Error::Unauthorized if device.nil?
  end

private
  def access_token_params
    { access_token: request.headers[:HTTP_ACCESS_TOKEN] }
  end
end