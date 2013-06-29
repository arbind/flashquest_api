require "spec_helper"

describe :branches, type: :request do
  include_context "json response"
  include_context "access token"

  let!(:branches)   { create_list :branch, 3 }

  context :GET do
    let (:http_path)  { api_v1_branches_path }
    let (:subject)    { branches }
    before { get http_path, nil, access_token_headers }
    it_behaves_like 'a protected endpoint', :get
    it_behaves_like 'a json list for', :branch
  end

  describe :branches_id do
    let (:http_path) { api_v1_branch_path(subject) }
    let (:subject)    { Branch.all[1] }
    it_behaves_like 'a protected endpoint', :get

    context :GET do
      before { get http_path, nil, access_token_headers }
      it_behaves_like 'a protected endpoint', :get
      it_behaves_like 'a json item for', :branch
    end
  end
end