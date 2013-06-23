class Api::V1::CommentsController < Api::V1::ApplicationController
  before_action :set_quest,  only: [:create]


  def create
   @quest.comments.push Comment.new comment_params
   render '/api/v1/quests/show'
  end

private
  def set_quest
    @quest = Quest.find(params[:quest_id])
  end

  def comment_params
      params.permit(:headline, :text, :photo_url)
    end
end