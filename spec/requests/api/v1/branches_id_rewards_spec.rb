require "spec_helper"

describe "/branches/:id/rewards", type: :request do
  include_context "json response"
  include_context "current user"
  include_context "activity"
  let (:branch)       { Branch.all.second }
  let (:http_path)    { api_v1_branch_rewards_path(branch) }

  context :GET do
    let (:subject)    { branch.rewards }
    it_behaves_like   "an array endpoint", :get, :reward
  end
end