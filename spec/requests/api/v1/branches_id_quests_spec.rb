require "spec_helper"

describe "/branches/:id/quests", type: :request do
  include_context "json response"
  include_context "access token"

  let!(:businesses)   { create_list :business, 3, :with_branches_and_patrons }
  let (:branch)       { Branch.all.second }
  let (:http_path)    { api_v1_branch_quests_path(branch) }

  context :GET do
    let (:subject)    { branch.quests }
    before { get http_path, nil, access_token_headers }
    it_behaves_like "a protected endpoint", :get
    it_behaves_like "a json list for", :patron
  end
end