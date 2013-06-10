class PatronsController < ApplicationController
  before_action :set_branch, only: [:index]
  before_action :set_patron, only: [:show]

  # GET /businesses/1/branches/1/patrons
  # GET /businesses/1/branches/1/patrons.json
  def index
    @patrons = @branch.patrons
  end

  # GET /patrons/1
  # GET /patrons/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_branch
      @branch = Branch.find(params[:branch_id])
    end

    def set_patron
      @patron = Patron.find(params[:id])
    end
end