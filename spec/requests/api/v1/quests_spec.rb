require "spec_helper"

describe "/quests", type: :request do
  include_context "json response"
  include_context "current user"
  include_context "activity"
  let (:http_path)    { api_v1_quests_path }

  context :GET do
    let (:subject)    { Quest.all }
    it_behaves_like   "an array endpoint", :get, :quest
  end

  describe "/:id" do
    let (:http_path)  { api_v1_quest_path(subject) }

    context :GET do
      let (:subject)  { Quest.all.second }
      it_behaves_like "an item endpoint", :get, :quest
    end
  end
end