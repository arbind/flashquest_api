require "spec_helper"

describe "/businesses/:id/quests", type: :request do
  include_context "activity"

  let (:http_path)  { api_v1_business_quests_path(business) }
  let (:business)   { Quest.first.patron.branch.business }

  context :GET do
    let (:subject)  { business.quests }
    it_behaves_like "an array endpoint", :get, :quest

    context "/?type=:photo" do
      let (:subject)      { business.quests.where(type: :photo) }
      let (:http_params)  { {type: :photo} }
      it_behaves_like "an array endpoint", :get, :quest
    end
  end
end