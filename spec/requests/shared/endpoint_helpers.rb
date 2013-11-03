module EndpointHelpers
  shared_examples_for 'an item endpoint' do |http_method, type|
    include_context "json response"
    include_context "current user"

    let(:_http_params)  { http_params if defined? http_params }

    it_behaves_like "a protected endpoint", http_method

    context do
      before { send http_method.to_sym, http_path, _http_params, access_token_headers }
      it_behaves_like "a json item", type
    end
  end

  shared_examples_for 'an array endpoint' do |http_method, type|
    include_context "json response"
    include_context "current user"

    let(:_http_params)  { http_params if defined? http_params }

    it_behaves_like "a protected endpoint", http_method

    context do
      before { send http_method.to_sym, http_path, _http_params, access_token_headers }
      it_behaves_like "a json list", type
    end
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
        expect(json_errors).to be_blank
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
        expect(json_errors.first).to match /unauthorized/i
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
        expect(json_errors.first).to match /unauthorized/i
      end
    end
  end
end