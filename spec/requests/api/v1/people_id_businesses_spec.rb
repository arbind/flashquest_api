require "spec_helper"

describe "/people/:id/businesses", type: :request do
  let!(:businesses)   { create_list :business, 3, :with_branches_and_patrons }
  let (:person)       { Person.all.second }
  let (:http_path)    { api_v1_person_businesses_path(person) }

  context :GET do
    let (:subject)    { businesses }
    before { extras = create_list :business, 5 }
    it_behaves_like "an array endpoint", :get, :business
  end

  describe "/people/:person_id/businesses/:id" do
    include_context 'json response'
    include_context 'current user'
    let (:businesses) { create :business, :with_branches_and_patrons }
    let (:http_path)  { api_v1_person_business_path(person, business) }
    let (:patron)     { Patron.all.second }
    let (:person)     { patron.person }
    let (:branch)     { patron.branch }
    let (:business)   { branch.business }
    let (:person_points) { patron.quests.first.points - patron.rewards.first.points }
    context :GET do
      let (:subject)  { business }
      before do
        patron.start_quest patron.branch.quest_descriptions.first
        patron.quests.first.approvals.create person_id: Person.last
        patron.redeem_reward patron.branch.reward_descriptions.first
      end
      before { get http_path, nil, access_token_headers }
      it_behaves_like "an item endpoint", :get, :business
      it "has the person's points at that business" do
        expect(json_data['points']).to eq person_points
      end
    end
  end

end