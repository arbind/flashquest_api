class Api::V1::DevicesController < Api::V1::ApplicationController

  def create
    @device = Device.where(device_params).first_or_create
    create_person_for @device if @device.person.nil?
    @current_user = @device.person
    @meta = { access_token: @device.access_token }
  end

private
  def device_params
    params.require(:device).permit(:identifier)
  end

  def create_person_for device
    person = Person.create
    person.devices << device
    person
  end

end