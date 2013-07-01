require 'spec_helper'

describe "/branches/:id/quest_descriptions/:id/quests", :type => :request do
  include_context 'json response'
  include_context 'current user'
  include_context "activity"

  let!(:num_quests)         { Quest.count }
  let (:branch)             { Branch.all.second }
  let (:quest_description)  { branch.quest_descriptions.first }
  let (:valid_attributes)   {
    {
      "text" => "a review",
      "photo_url" => "http://placekitten.com/200/200"
    }
  }

  describe ":POST" do
    let (:http_path)      { api_v1_new_quest_path(branch, quest_description) }
    let (:http_params)    { { review: valid_attributes} }
    let (:subject)        { nil }
    it_behaves_like 'an item endpoint', :post, :quest

    context do
      before { post http_path, http_params, access_token_headers }
      it "creates a new quest" do
        expect(Quest.count).to be num_quests + 1
      end
      it "creates a new review" do
        expect(json_data['review']).to include valid_attributes
      end
    end
  end
end