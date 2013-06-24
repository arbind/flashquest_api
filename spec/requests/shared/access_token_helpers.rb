module AccessTokenHelpers
  shared_context "access token" do
    let!(:current_device_identifier)  { 'a-hardware-identifier' }
    let!(:current_device) {
      d = Device.create identifier: current_device_identifier
    }
    let!(:current_person) {
      p = Person.create
      p.devices << current_device
      p
    }

    let!(:access_token)       { current_device.access_token }
    let (:http_header_token)  { { access_token: access_token } }
  end

  shared_examples_for 'a protected endpoint' do |http_method|
    context 'with a good access token' do
      before{ send(http_method.to_sym, http_path, http_params, http_header_token) }
      it 'response status is not 401' do
        expect(response.status).not_to eq 401
      end
      it 'response has no errors' do
        expect(json_error).to be_nil
      end
    end
    context 'without an access token' do
      before{ send(http_method.to_sym, http_path, http_params, nil) }
      it 'response status is 401' do
        expect(response.status).to eq 401
      end
      it 'responds with an error' do
        expect(json_error).to match /unauthorized/i
      end
    end
    context 'without an access token' do
      let (:http_header_token)  { { access_token: "#{access_token}-xx" } }
      before{ send(http_method.to_sym, http_path, http_params, http_header_token) }
      it 'response status is 401' do
        expect(response.status).to eq 401
      end
      it 'responds with an error' do
        expect(json_error).to match /unauthorized/i
      end
    end
  end
end