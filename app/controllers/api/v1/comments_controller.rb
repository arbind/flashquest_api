class Api::V1::CommentsController < Api::V1::ApplicationController
  before_action :ensure_access_token
  before_action :set_quest,  only: [:create, :destroy]

  # POST /api/v1/quests/:quest_id/comments
  def create
    comment = Comment.new comment_params
    @quest.comments << comment
    @current_user.comments << comment

    render template: '/api/v1/quests/show'
  end

  # DELETE /api/v1/quests/:quest_id/comments/:id
  def destroy
    @quest.comments.find(params[:id]).destroy
    @quest.reload
    render template: '/api/v1/quests/show', status: 205
  end

private
  def set_quest
    @quest = Quest.find(params[:quest_id])
  end

  def comment_params
    params.require(:comment).permit(:headline, :text, :photo_url)
  end

end