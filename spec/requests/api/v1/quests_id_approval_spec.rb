require 'spec_helper'

describe "/quests/:id/approvals", :type => :request do
  include_context "json response"
  include_context "current user"
  include_context "activity"

  let (:quest)               { Quest.all.second}
  let (:patron)              { quest.patron }
  let!(:approval)            {
    quest.approvals.create person_id: Person.last
  }
  let (:approvals)           { quest.approvals }
  let!(:num_approvals)       { approvals.count }
  let (:json_approvals)      { json_data['approvals']}

  describe :POST do
    let (:http_path)          { api_v1_quest_approvals_path(quest) }
    let (:http_params)        { nil }
    let (:subject)            { nil }
    it_behaves_like 'an item endpoint', :post, :quest

    context do
      before { post http_path, http_params, access_token_headers }
      before { quest.reload }
      it "adds a approval to the quest" do
        expect(quest.approvals.count).to be num_approvals + 1
        expect(json_approvals.length).to be num_approvals + 1
      end
    end
  end

  describe "DELETE /quests/:id/approvals" do
    let (:http_path)    { api_v1_quest_approval_path(quest, approval) }
    let (:http_params)  { nil }

    it_behaves_like 'a protected endpoint', :delete

    context "for the current user" do
      before { delete http_path, http_params, access_token_headers }
      before { quest.reload }
      it "responds with 205" do
        expect(response.status).to be 205
      end

      it "removes the approval" do
        expect(quest.approvals.count).to be num_approvals - 1
        expect(json_approvals.length).to be num_approvals - 1
      end
    end

    context "given a non-existent id" do
      before { delete http_path, http_params, access_token_headers }
      let (:http_path)    { "#{api_v1_quest_approval_path(quest, approval)}xxx" }
      it "responds with 404" do
        expect(response.status).to be 404
      end
    end
  end
end