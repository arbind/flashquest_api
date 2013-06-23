class Api::V1::CommentsController < Api::V1::ApplicationController
  before_action :set_quest,  only: [:create, :destroy]

  # POST /api/v1/quests/:quest_id/comments
  def create
    @quest.comments.push Comment.new comment_params
    render '/api/v1/quests/show'
  end

  # DELETE /api/v1/quests/:quest_id/comments/:id
  def destroy
    @quest.comments.find(params[:id]).destroy
    render json: :deleted, status: 204
  rescue Exception => ex
    logger.error delete_error_message
    render json: :error, status: 404
  end

private
  def set_quest
    @quest = Quest.find(params[:quest_id])
  end

  def comment_params
    params.require(:comment).permit(:headline, :text, :photo_url)
  end

  def delete_error_message
    {
      comment: :delete,
      quest:params[:quest_id],
      comment: params[:id],
      error: ex.message
    }
  end

end