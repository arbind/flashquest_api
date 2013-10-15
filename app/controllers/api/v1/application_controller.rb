class Api::V1::ApplicationController < ApplicationController
  layout 'api_v1'
  protect_from_forgery with: :null_session
  skip_before_filter  :verify_authenticity_token # safe for API, as CSRF attack can only happen from browser
  rescue_from Exception, :with => :render_exception

  def render_exception(exception)
    if exception.respond_to? :code
      response.status = exception.code
    elsif exception.kind_of? Mongoid::Errors::DocumentNotFound
      response.status = 404
    else
      response.status = 500
    end

    if exception.respond_to? :message
      @error = exception.message
    else
      @error = exception.to_s
    end

    render template: "api/v1/error"
  end

  def ensure_access_token
    return @current_user if @current_user
    raise Api::V1::Error::NoAccessToken if access_token.empty?
    device = Device.where(access_token: access_token).first
    raise Api::V1::Error::Unauthorized if device.nil? or device.person.nil?
    @current_user = device.person
  end

private
  def access_token
    request.headers[:HTTP_X_API_TOKEN].to_s.squish
  end
end