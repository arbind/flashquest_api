require "spec_helper"

describe "/quests", type: :request do
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


    context :DELETE do
      include_context "json response"
      include_context "current user"
      let!(:num_quests) { Quest.count }
      let (:subject)    { Quest.all.second }
      it_behaves_like 'a protected endpoint', :delete

      context "given a quest" do
        before { delete http_path, nil, access_token_headers }
        it "responds with 205" do
          expect(response.status).to be 205
        end
        it "removes the quest" do
          expect(Quest.count).to be num_quests - 1
        end
      end

      context "given a missing quest" do
        before { http_path }
        before { subject.destroy }
        before { delete http_path, nil, access_token_headers }
        it "responds with 404" do
          expect(response.status).to be 404
        end
      end
    end
  end
end