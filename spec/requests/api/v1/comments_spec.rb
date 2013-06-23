require 'spec_helper'

describe "Comments", :type => :request do
  include_context "json response"
  let (:valid_attributes)   {
    {
      text: 'a note',
    }
  }

  let (:person)             { Person.create }
  let (:business)           { Business.create }
  let (:branch)             { business.branches.create }
  let (:quest_description)  { branch.quest_descriptions.create }
  let (:patron)             { person.patronize branch }
  let (:quest)              { patron.start_quest quest_description }
  let (:comments)           { quest.comments = [Comment.new(text:'0'), Comment.new(text:'1'), Comment.new(text:'1')]}
  let!(:num_comments)       { comments.count }

  let (:comment_path)       { api_v1_quest_comments_path(quest) }
  let (:json_comments)      { json_data['comments']}

  describe "POST /quests/:id/comments" do
    before { post comment_path, comment: valid_attributes }
    before { quest.reload }
    it "responds with 200" do
      expect(response.status).to be 200
    end
    it "adds a comment" do
      expect(quest.comments.count).to be num_comments + 1
      expect(json_comments.count).to be num_comments + 1
    end
  end

  describe "DELETE /quests/:id/comments" do
    let (:comment)      { comments[1] }
    let (:comment_path) { api_v1_quest_comment_path(quest, comment) }
    before { delete comment_path }
    before { quest.reload }

    it "responds with 204" do
      expect(response.status).to be 204
    end

    it "removes the comment" do
      expect(quest.comments.count).to be num_comments - 1
    end

    context "given a non-existent id" do
      let (:comment_path) { "#{api_v1_quest_comment_path(quest, comment)}xxx" }
      it "responds with 404" do
        expect(response.status).to be 404
      end
    end
  end

end