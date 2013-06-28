require 'spec_helper'

describe :me, :type => :request do
  include_context "json response"
  include_context "access token"



  describe "/me" do
    let (:http_path) { api_v1_me_path }
    it_behaves_like 'a protected endpoint', :get

    context :GET do
      let(:a_person) { current_person }
      before { get http_path, nil, access_token_headers }
      it_behaves_like 'a json person'
    end
  end
end