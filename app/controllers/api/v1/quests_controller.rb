class Api::V1::QuestsController < Api::V1::ApplicationController
  before_action :ensure_access_token
  before_action :set_quest,  only: [:show, :destroy]
  before_action :set_quests, only: [:index]

  # GET /quests
  # GET /people/1/quests
  # GET /patrons/1/quests
  # GET /branches/1/quests
  # GET /businesses/1/quests
  def index
  end

  # GET /quests/1
  def show
  end

  # POST /branches/:id/quest_descriptions/:id/quests
  def create
    @branch = Branch.find(params[:branch_id])
    @patron = @current_user.patronize @branch
    @quest_description = @branch.quest_descriptions.find(params[:quest_description_id])
    @quest = @patron.start_quest @quest_description
    @quest.create_review(review_params) if review_params
    render '/api/v1/quests/show'
  end

  # DELETE /quests/:id
  def destroy
    @quest.destroy
    render json: { meta: {}, data: {} }.to_json, status: 205
  end

  private

  def review_params
    return nil unless params[:review]
    params.require(:review).permit(:rating, :headline, :text, :photo_url)
  end

  def set_quests
    @context = @business = Business.find(params[:business_id]) if params[:business_id]
    @context = @branch   = Branch.find(params[:branch_id]) if params[:branch_id]
    @context = @patron   = Patron.find(params[:patron_id]) if params[:patron_id]
    @context = @person   = Person.find(params[:person_id]) if params[:person_id]
    @quests  = @context.quests if @context
    @quests ||= Quest.all
    @quests  = @quests.where(type: params[:type].to_sym) if params[:type]
    @quests  = @quests.order_by(:created_at.desc)
  end

  def set_quest
    @quest = Quest.find(params[:id])
  end
end