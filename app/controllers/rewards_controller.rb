class RewardsController < ApplicationController
  before_action :set_reward, only: [:show]
  before_action :set_rewards, only: [:index]

  # GET /rewards
  # GET /branches/1/rewards
  # GET /patron/1/rewards
  # GET /businesses/1/rewards
  def index
  end

  # GET /rewards/1
  def show
  end

  private
    def set_rewards
      @context = @business = Business.find(params[:business_id]) if params[:business_id]
      @context = @branch   = Branch.find(params[:branch_id]) if params[:branch_id]
      @context = @patron   = Patron.find(params[:patron_id]) if params[:patron_id]
      @rewards = @context.rewards if @context
      @rewards ||= Reward.all
      @rewards  = @rewards.where(type: params[:type].to_sym) if params[:type]
    end

    def set_reward
      @reward = Reward.find(params[:id])
    end

end