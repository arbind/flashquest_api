require 'spec_helper'

describe "/me/feed", :type => :request do
  include_context "json response"
  include_context "access token"
  include_context "activity"

  let (:http_path)  { api_v1_me_feed_path }

  context :GET do
    let (:subject)    { Activity.all }
    before { get http_path, nil, access_token_headers }
    it_behaves_like "a protected endpoint", :get
    it_behaves_like "a json list for", :activity
    it "has everyone's activities" do
      expect(json_data.length).to eq Activity.count
    end
  end
end