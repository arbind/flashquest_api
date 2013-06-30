module AccessTokenHelpers
  shared_context "current user" do
    let!(:current_device_identifier)  { 'a-hardware-identifier' }
    let!(:current_device) {
      Device.create identifier: current_device_identifier
    }
    let!(:me) {
      person = Person.create
      person.devices << current_device
      person
    }

    let!(:access_token)       { current_device.access_token }

    let(:_http_params)        { http_params if defined? http_params }
    let (:access_token_headers)      {
      access_token_headers = http_headers if defined? http_headers
      access_token_headers ||= {}
      access_token_headers.merge!({ HTTP_ACCESS_TOKEN: access_token })
    }
  end
end