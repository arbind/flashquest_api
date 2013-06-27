module AccessTokenHelpers
  shared_context "access token" do
    let!(:current_device_identifier)  { 'a-hardware-identifier' }
    let!(:current_device) {
      Device.create identifier: current_device_identifier
    }
    let!(:current_person) {
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

  shared_examples_for 'a protected endpoint' do |http_method|
    context 'with a good access token' do
      before do
        _http_method = http_method.to_sym if defined? http_method
        _http_method ||= :get
        send(_http_method, http_path, _http_params, access_token_headers)
      end
      it 'response status is not 401' do
        expect(response.status).not_to eq 401
      end
      it 'response has no errors' do
        expect(json_error).to be_nil
      end
    end
    context 'without an access token' do
      before do
        _http_method = http_method.to_sym if defined? http_method
        _http_method ||= :get
        send(_http_method, http_path, _http_params, nil)
      end
      it 'response status is 401' do
        expect(response.status).to eq 401
      end
      it 'responds with an error' do
        expect(json_error).to match /unauthorized/i
      end
    end
    context 'without an access token' do
      let (:access_token_headers)  {
        access_token_headers = http_headers if defined? http_headers
        access_token_headers ||= {}
        access_token_headers.merge!({ access_token: "#{access_token}-xx" })
      }
      before do
        _http_method = http_method.to_sym if defined? http_method
        _http_method ||= :get
        send(_http_method, http_path, _http_params, access_token_headers)
      end
      it 'response status is 401' do
        expect(response.status).to eq 401
      end
      it 'responds with an error' do
        expect(json_error).to match /unauthorized/i
      end
    end
  end
end