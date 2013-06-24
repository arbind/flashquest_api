module AccessTokenHelpers
  shared_context "access token" do
    let (:current_device_identifier)  { 'a-hardware-identifier' }
    let (:current_device) {
      Device.create identifier: current_device_identifier
    }
    let (:current_person) {
      p = Person.create
      p.devices = [ current_device ]
      p
    }

    let (:access_token)               { current_device.access_token }
    let (:http_access_token_headers)  { { access_token: access_token } }
  end
end