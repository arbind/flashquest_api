require "spec_helper"

describe "/branches/:id/quests", type: :request do
  include_context "activity"

  let (:http_path)  { api_v1_branch_quests_path(branch) }
  let (:branch)     { Quest.first.patron.branch }

  context :GET do
    let (:subject)  { branch.quests }
    it_behaves_like "an array endpoint", :get, :quest

    context "/?type=:photo" do
      let (:subject)      { branch.quests.where(type: :photo) }
      let (:http_params)  { {type: :photo} }
      it_behaves_like "an array endpoint", :get, :quest
    end
  end
end