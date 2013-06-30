require "spec_helper"

describe "/businesses/:id/rewards", type: :request do
  include_context "activity"
  let (:business)     { Business.all.second }
  let (:http_path)    { api_v1_business_rewards_path(business) }

  context :GET do
    let (:subject)    { business.rewards }
    it_behaves_like   "an array endpoint", :get, :reward
  end
end