class QuestsController < ApplicationController
  before_action :set_quest,  only: [:show]
  before_action :set_quests, only: [:index]

  # GET /quests
  # GET /branches/1/quests
  # GET /patron/1/quests
  # GET /businesses/1/quests
  def index
  end

  # GET /quests/1
  def show
  end


  private
    def set_quests
      @context = @business = Business.find(params[:business_id]) if params[:business_id]
      @context = @branch   = Branch.find(params[:branch_id]) if params[:branch_id]
      @context = @patron   = Patron.find(params[:patron_id]) if params[:patron_id]
      @quests  = @context.quests if @context
      @quests ||= Quest.all
      @quests  = @quests.where(type: params[:type].to_sym) if params[:type]
    end

    def set_quest
      @quest = Quest.find(params[:id])
    end

end