class Api::V1::RewardsController < Api::V1::ApplicationController
  before_action :ensure_access_token
  before_action :set_reward, only: [:show]
  before_action :set_rewards, only: [:index]

  # GET /rewards
  # GET /people/1/rewards
  # GET /patrons/1/rewards
  # GET /branches/1/rewards
  # GET /businesses/1/rewards
  def index
  end

  # GET /rewards/1
  def show
  end

  # POST /branches/:id/reward_descriptions/:id/rewards
  def create
    @branch = Branch.find(params[:branch_id])
    @patron = @current_user.patronize @branch
    @reward_description = @branch.reward_descriptions.find(params[:reward_description_id])
    @reward = @patron.redeem_reward @reward_description
    render '/api/v1/rewards/show'
  end

  private
    def set_rewards
      @context = @business = Business.find(params[:business_id]) if params[:business_id]
      @context = @branch   = Branch.find(params[:branch_id]) if params[:branch_id]
      @context = @patron   = Patron.find(params[:patron_id]) if params[:patron_id]
      @context = @person   = Person.find(params[:person_id]) if params[:person_id]
      @rewards = @context.rewards if @context
      @rewards ||= Reward.all
      @rewards  = @rewards.where(type: params[:type].to_sym) if params[:type]
    end

    def set_reward
      @reward = Reward.find(params[:id])
    end
end