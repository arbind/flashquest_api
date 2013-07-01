class Api::V1::ApprovalsController < Api::V1::ApplicationController
  before_action :ensure_access_token
  before_action :set_quest, only: [:create, :destroy]

  # POST /api/v1/quests/:quest_id/approvals
  def create
    approval = @quest.approvals.create({person: @current_user})
    render template: '/api/v1/quests/show'
  end

  # DELETE /api/v1/quests/:quest_id/approvals/:id
  def destroy
    @quest.approvals.find(params[:id]).destroy
    @quest.reload
    render template: '/api/v1/quests/show', status: 205
  end

  private

  def set_quest
    @quest = Quest.find(params[:quest_id])
  end
end