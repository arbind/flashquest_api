require 'spec_helper'

shared_context "an access token request" do

  it "responds with 200" do
    expect(response.status).to be 200
  end

  it "responds with an access token" do
    expect(json_access_token).not_to be_nil
  end

  it "responds with the person who owns the device" do
    expect(json_person).to be_present
    expect(json_person['person_path']).to be_present
  end
end

describe "Devices", :type => :request do
  include_context "json response"
  let (:valid_attributes)   {
    {
      identifier: 'my-device-identifier',
    }
  }

  let (:devices_path)         { api_v1_devices_path }
  let (:json_access_token)    { json_meta['access_token']}
  let (:json_person)          { json_data }

  let (:num_devices)      { Device.count }
  let (:num_people)       { Person.count }

  let (:http_path)        { devices_path }
  let (:http_headers)     { nil }
  let (:http_parameters)  { {device: valid_attributes} }

  describe "POST /devices" do

    context "from a new device:" do
      before { num_devices and num_people }
      before { post http_path, http_parameters, http_headers }
      it_behaves_like "an access token request"
      it "adds a new device" do
        expect(Device.count).to be num_devices + 1
      end
      it "adds a new person" do
        expect(Person.count).to be num_people + 1
      end
    end

    context "from a returning device:" do
      let!(:device) { Device.create valid_attributes }
      let!(:person) {
        p = Person.create
        p.devices = [ device ]
        p
      }
      let!(:access_token) { device.access_token }

      before { num_devices and num_people }
      before { post http_path, http_parameters, http_headers }

      it_behaves_like "an access token request"
      it "doesn't add another device" do
        expect(Device.count).to be num_devices
      end
      it "doesn't add another person" do
        expect(Person.count).to be num_people
      end
      it "returns the right access token" do
        expect(json_access_token).to eq access_token
      end
    end
  end
end