class Api::V1::DevicesController < Api::V1::ApplicationController

  def create
    @device = Device.where(device_params).first_or_create
    if @device.person.nil?
      person = Person.create
      person.devices << @device
    end
    @current_user = @device.person
    @meta = { access_token: @device.access_token }
  end

private
  def device_params
    params.require(:device).permit(:identifier)
  end
end