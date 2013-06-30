require 'spec_helper'

describe "/me/activity", :type => :request do
  include_context "json response"
  include_context "current user"
  include_context "activity"

  let (:http_path)  { api_v1_me_activities_path }

  context :GET do
    let (:subject)  { me.activities }
    it_behaves_like "an array endpoint", :get, :activity

    describe 'response' do
      before { get http_path, nil, access_token_headers }
      it "does not have all activities" do
        expect(json_data.length).not_to eq Activity.count
      end
    end
  end
end