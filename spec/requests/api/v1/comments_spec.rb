require 'spec_helper'

describe "Comments", :type => :request do
  include_context "json response"
  include_context "access token"

  let (:valid_attributes)   {
    {
      text: 'a note',
    }
  }

  let (:person)             { create :person }
  let (:business)           { create :business }
  let (:branch)             { business.branches.create }
  let (:quest_description)  { branch.quest_descriptions.create }
  let (:patron)             { person.patronize branch }
  let (:quest)              { patron.start_quest quest_description }
  let (:comments)           {
    create_list :comment, 5, person: person, quest: quest
  }
  let!(:num_comments)       { comments.count }

  let (:json_comments)      { json_data['comments']}

  describe "POST /quests/:id/comments" do
    let (:http_path)          { api_v1_quest_comments_path(quest) }
    let (:http_params)        { {comment: valid_attributes} }

    it_behaves_like 'a protected endpoint', :post

    context "for the current user" do
      before { post http_path, http_params, access_token_headers }
      before { quest.reload }
      it "responds with 200" do
        expect(response.status).to be 200
      end
      it "adds a comment" do
        expect(quest.comments.count).to be num_comments + 1
        expect(json_comments.length).to be num_comments + 1
      end
    end
  end

  describe "DELETE /quests/:id/comments" do
    let (:comment)      { comments[1] }
    let (:http_path)    { api_v1_quest_comment_path(quest, comment) }
    let (:http_params)  { nil }

    it_behaves_like 'a protected endpoint', :delete

    context "for the current user" do
      before { delete http_path, http_params, access_token_headers }
      before { quest.reload }
      it "responds with 205" do
        expect(response.status).to be 205
      end

      it "removes the comment" do
        expect(quest.comments.count).to be num_comments - 1
        expect(json_comments.length).to be num_comments - 1
      end
    end

    context "given a non-existent id" do
      before { delete http_path, http_params, access_token_headers }
      let (:http_path)    { "#{api_v1_quest_comment_path(quest, comment)}xxx" }
      it "responds with 404" do
        expect(response.status).to be 404
      end
    end
  end
end