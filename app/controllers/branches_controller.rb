class BranchesController < ApplicationController
  before_action :set_branches, only: [:index]
  before_action :set_branch,   only: [:show]

  # GET /branches
  # GET /businesses/1/branches
  def index
  end

  # GET /branches/1
  def show
  end

  private
    def set_branches
      @context = @business = Business.find(params[:business_id]) if params[:business_id]
      @branches  = @context.branches if @context
      @branches ||= Branch.all
    end

    def set_branch
      @branch = Branch.find(params[:id])
    end
end