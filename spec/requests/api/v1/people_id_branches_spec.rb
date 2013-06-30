require "spec_helper"

describe "/people/:id/branches", type: :request do
  let!(:businesses)   { create_list :business, 3, :with_branches_and_patrons }
  let (:person)       { Person.all.second }
  let (:http_path)    { api_v1_person_branches_path(person) }

  context :GET do
    let (:subject)    { person.branches }
    it_behaves_like   "an array endpoint", :get, :branch
 end

  describe "/people/:person_id/branches/:id" do
    include_context 'json response'
    include_context 'current user'
    let (:businesses) { create :business, :with_branches_and_patrons }
    let (:http_path)  { api_v1_person_branch_path(person, branch) }
    let (:patron)     { Patron.all.second }
    let (:person)     { patron.person }
    let (:branch)     { patron.branch }
    let (:patron_points) { patron.quests.first.points - patron.rewards.first.points }
    let (:patron_points_at_branch) { patron_points }
    context :GET do
      let (:subject)  { branch }
      before do
        patron.start_quest patron.branch.quest_descriptions.first
        patron.quests.first.approvals.create person_id: Person.last
        patron.redeem_reward patron.branch.reward_descriptions.first
      end
      before { get http_path, nil, access_token_headers }
      it_behaves_like "an item endpoint", :get, :branch
      it "has the person's points at that business" do
        expect(json_data['points']).to eq patron_points
      end
      it "has the person's points at that branch" do
        expect(json_data['points_at_branch']).to eq patron_points_at_branch
      end
    end
  end
end