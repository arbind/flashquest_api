require "spec_helper"

describe "/branches/:id/quests", type: :request do
  include_context "json response"
  include_context "access token"
  include_context "activity"

  let (:http_path)    { api_v1_branch_quests_path(branch) }

  context :GET do
    let (:branch)     { Quest.first.patron.branch }
    let (:subject)    { branch.quests }
    before { get http_path, nil, access_token_headers }
    it_behaves_like "a protected endpoint", :get
    it_behaves_like "a json list for", :quest

    context "/?type=:photo" do
      let (:branch)     { Quest.first.patron.branch }
      let (:subject)    { branch.quests.where(type: :photo) }
      before { get http_path, {type: :photo}, access_token_headers }
      it_behaves_like "a protected endpoint", :get
      it_behaves_like "a json list for", :quest
    end

  end
end