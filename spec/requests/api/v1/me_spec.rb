require 'spec_helper'

describe "/me", :type => :request do
  include_context "json response"
  include_context "access token"
  let(:subject) { current_person }

  context :GET do
    let (:http_path)  { api_v1_me_path }
    before { get http_path, nil, access_token_headers }
    it_behaves_like 'a protected endpoint', :get
    it_behaves_like 'a json item for', :person
  end

  context :PATCH do
    let (:json_twitter)     { json_data["twitter"] }
    let (:json_facebook)    { json_data["facebook"] }
    let (:http_path)        { api_v1_my_profile_path }

    let(:twitter_screen_name) { '_me.twitter' }
    let (:twitter_profile)  {{
      "id" => 11,
      'name' => '_me',
      'screen_name' => twitter_screen_name
    }}

    let(:facebook_username)   { '_me.facebook' }
    let (:facebook_profile) {{
      "id" => 22,
      'name' => '_me',
      'username' => facebook_username
      }}
    let (:valid_attributes)   {
      {
        "name" => 'Tara',
        "twitter" => twitter_profile,
        "facebook" => facebook_profile,
      }
    }
    let (:http_params)  { {me: valid_attributes} }
    before { expect(subject.attributes).to_not include valid_attributes.slice("name") }
    before { patch http_path, http_params, access_token_headers }
    before { subject.reload }
    it_behaves_like 'a protected endpoint', :patch
    it_behaves_like 'a json item for', :person
    it "responds with an updated profile" do
      expect(json_data).to include valid_attributes.slice("name")
      expect(json_twitter["screen_name"]).to eq twitter_screen_name
      expect(json_facebook["username"]).to eq facebook_username
    end
    it "updates the current user's profile" do
      expect(subject.attributes).to include valid_attributes.slice("name")
    end
  end
end