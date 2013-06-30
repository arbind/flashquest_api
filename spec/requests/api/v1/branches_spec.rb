require "spec_helper"

describe "/branches", type: :request do
  include_context "access token"
  include_context "json response"
  let!(:branches)     { create_list :branch, 3 }
  let (:http_path)    { api_v1_branches_path }

  context :GET do
    let (:subject)    { branches }
    before { get http_path, nil, access_token_headers }
    it_behaves_like 'a protected endpoint', :get
    it_behaves_like 'a json list for', :branch
  end

  describe "/:id" do
    let (:http_path)  { api_v1_branch_path(subject) }

    context :GET do
      let (:subject)  { Branch.all.second }
      before { get http_path, nil, access_token_headers }
      it_behaves_like 'a protected endpoint', :get
      it_behaves_like 'a json item for', :branch
    end
  end
end