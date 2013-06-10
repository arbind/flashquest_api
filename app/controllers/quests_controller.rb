class QuestsController < ApplicationController
  before_action :set_branch, only: [:index]
  before_action :set_quest, only: [:show]

  # GET /branches/1/quests
  # GET /branches/1/quests.json
  def index
    @quests = @branch.quests
  end

  # GET /quests/1
  # GET /quests/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_branch
      @branch = Branch.find(params[:branch_id])
    end

    def set_quest
      @quest = Quest.find(params[:id])
    end

end