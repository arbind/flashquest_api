require 'spec_helper'

describe "/me/feed", :type => :request do
  include_context "json response"
  include_context "access token"

  let!(:businesses) { create_list :business, 3, :with_branches_and_patrons }
  let (:http_path)  { api_v1_me_feed_path }
  before do
    branch = Business.first.branches.first
    patron = me.patronize branch
    quest = patron.start_quest branch.quest_descriptions.first
    other_person = Person.ne(id: me.id).first
    other_patron = other_person.patronize branch
    other_quest = other_patron.start_quest branch.quest_descriptions.first
  end

  context :GET do
    let (:subject)    { Activity.all }
    before { get http_path, nil, access_token_headers }
    it_behaves_like "a protected endpoint", :get
    it_behaves_like "a json list for", :activity
    it "has everyone's activities" do
      expect(json_data.length).to eq Activity.count
    end
  end
end