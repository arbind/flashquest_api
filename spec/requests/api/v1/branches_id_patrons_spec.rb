require "spec_helper"

describe "/branches/:id/patrons", type: :request do
  include_context "json response"
  include_context "access token"

  let!(:branches)     { create_list :branch, 3, :with_patrons }
  let (:branch)       { Branch.all.second }
  let (:http_path)    { api_v1_branch_patrons_path(branch) }

  context :GET do
    let (:subject)    { branch.patrons }
    before { get http_path, nil, access_token_headers }
    it_behaves_like "a protected endpoint", :get
    it_behaves_like "a json list for", :patron
  end
end