class RewardsController < ApplicationController
  before_action :set_branch, only: [:index]
  before_action :set_reward, only: [:show]

  # GET /branches/1/rewards
  # GET /branches/1/rewards.json
  def index
    @rewards = @branch.rewards
  rescue
    404
  end

  # GET /rewards/1
  # GET /rewards/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_branch
      @branch = Branch.find(params[:branch_id])
    end

    def set_reward
      @reward = Reward.find(params[:id])
    end

end