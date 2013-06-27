require 'spec_helper'

describe "Me", :type => :request do
  include_context "json response"
  include_context "access token"

  describe "GET /me" do
    let (:http_path) { api_v1_me_path }
    it_behaves_like 'a protected endpoint', :get

    context do
      before { get http_path, nil, access_token_headers }
      let(:a_person) { current_person }
      it_behaves_like 'a json person'
    end
  end
end