require 'spec_helper'

describe "/quests/:id/comments", :type => :request do
  include_context "json response"
  include_context "current user"
  include_context "activity"

  let (:quest)              { Comment.all.second.quest }
  let (:comments)           { quest.comments }
  let!(:num_comments)       { comments.count }
  let (:valid_attributes)   {
    {
      text: 'a note',
    }
  }
  let (:json_comments)      { json_data['comments']}

  describe :POST do
    let (:http_path)          { api_v1_quest_comments_path(quest) }
    let (:http_params)        { {comment: valid_attributes} }
    let (:subject)            { nil }
    it_behaves_like 'an item endpoint', :post, :quest

    context do
      before { post http_path, http_params, access_token_headers }
      before { quest.reload }
      it "adds a comment to the quest" do
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