class BranchesController < ApplicationController
  before_action :set_business, only: [:index]
  before_action :set_branch, only: [:show]

  # GET /businesses/1/branches
  # GET /businesses/1/branches.json
  def index
    @branches = @business.branches
  end

  # GET /businesses/1/branches/1
  # GET /businesses/1/branches/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_business
      @business = Business.find(params[:business_id])
    end

    def set_branch
      @branch = Branch.find(params[:id])
    end
end