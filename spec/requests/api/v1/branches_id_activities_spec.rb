require "spec_helper"

describe "/branches/:id/activities", type: :request do
  include_context "activity"

  let (:branch)     { Branch.all.second }
  let (:http_path)  { api_v1_branch_activities_path(branch) }

  context :GET do
    let (:subject)  { branch.activities }
    it_behaves_like "an array endpoint", :get, :activity
  end
end