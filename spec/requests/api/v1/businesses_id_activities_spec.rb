require "spec_helper"

describe "/businesses/:id/activities", type: :request do
  include_context "activity"

  let (:business)     { Business.all.second }
  let (:http_path)  { api_v1_business_activities_path(business) }

  context :GET do
    let (:subject)  { business.activities }
    it_behaves_like "an array endpoint", :get, :activity
  end
end