require 'spec_helper'

describe "/me", :type => :request do
  include_context "json response"
  include_context "access token"
  let(:me)          { current_person }
  let(:a_person)    { current_person }

  context :GET do
    let (:http_path)  { api_v1_me_path }
    before { get http_path, nil, access_token_headers }
    it_behaves_like 'a protected endpoint', :get
    it_behaves_like 'a json person'
  end

  context :PATCH do
    let (:http_path)  { api_v1_my_profile_path }
    let (:valid_attributes)   {
      {
        "display_name" => 'Tara',
      }
    }
    let (:http_params)  { {me: valid_attributes} }
    before { expect(me.attributes).to_not include valid_attributes }
    before { patch http_path, http_params, access_token_headers }
    before { a_person.reload }
    it_behaves_like 'a protected endpoint', :patch
    it_behaves_like 'a json person'
    it "responds with an updated profile" do
      expect(json_data).to include valid_attributes
    end
    it "updates the current user's profile" do
      expect(me.attributes).to include valid_attributes
    end
  end
end