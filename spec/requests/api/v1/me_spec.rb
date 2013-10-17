require 'spec_helper'

describe "/me", :type => :request do
  include_context "json response"
  include_context "current user"
  let(:subject) { me }

  context :GET do
    let (:http_path)  { api_v1_me_path }
    it_behaves_like "an item endpoint", :get, :person
  end

  context :PATCH do
    let (:json_twitter)     { json_data["twitter"] }
    let (:json_facebook)    { json_data["facebook"] }
    let (:http_path)        { api_v1_my_profile_path }

    let(:twitter_screen_name) { '_me.twitter' }
    let(:followers_count)     { '20' }
    let (:twitter_profile)  {{
      "id" => 11,
      'name' => '_me',
      'screen_name' => twitter_screen_name,
      'followers_count' => followers_count
    }}

    let(:facebook_username)   { '_me.facebook' }
    let (:facebook_profile) {{
      "id" => 22,
      'name' => '_me',
      'username' => facebook_username
      }}
    let (:valid_attributes)   {
      {
        "twitter" => twitter_profile,
        "facebook" => facebook_profile,
      }
    }
    let (:http_params)  { {me: valid_attributes} }
    it_behaves_like "an item endpoint", :patch, :person

    describe "updates my profile" do
      before { expect(subject.attributes).to_not include valid_attributes.slice("name") }
      before { patch http_path, http_params, access_token_headers }
      before { subject.reload }
      it "responds with an updated profile" do
        expect(json_data).to include valid_attributes.slice("name")
        expect(json_twitter["screen_name"]).to eq twitter_screen_name
        expect(json_facebook["username"]).to eq facebook_username
      end
      it "updates the current user's profile" do
        expect(subject.twitter['followers_count']).to eq followers_count
      end
    end
  end
end