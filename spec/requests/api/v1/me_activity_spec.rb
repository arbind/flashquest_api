require 'spec_helper'

describe "/me/activity", :type => :request do
  include_context "json response"
  include_context "access token"

  let!(:businesses) { create_list :business, 3, :with_branches_and_patrons }
  let (:http_path)  { api_v1_me_activity_path }
  before do
    branch = Business.first.branches.first
    patron = me.patronize branch
    quest = patron.start_quest branch.quest_descriptions.first
    other_person = Person.ne(id: me.id).first
    other_patron = other_person.patronize branch
    other_quest = other_patron.start_quest branch.quest_descriptions.first
    comment = Comment.create quest: quest, person: me
  end

  context :GET do
    before { get http_path, nil, access_token_headers }
    it_behaves_like "a protected endpoint", :get
    it_behaves_like "a json list for", :activity
    it "does not have all activities" do
      expect(json_data.length).not_to eq Activity.count
    end
    it "has only my activities" do
      expect(me.activities.count).to be < Activity.count
      expect(json_data.length).to eq me.activities.count
    end
  end
end