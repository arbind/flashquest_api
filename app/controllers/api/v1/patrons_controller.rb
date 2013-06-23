class Api::V1::PatronsController < Api::V1::ApplicationController
  before_action :set_patron,  only: [:show]
  before_action :set_patrons, only: [:index]

  # GET /patrons
  # GET /people/1/patrons.json
  # GET /branches/1/patrons.json
  # GET /businesses/1/patrons.json
  def index
  end

  # GET /patrons/1
  # GET /patrons/1.json
  def show
  end

  private
    def set_patrons
      @context = @business = Business.find(params[:business_id]) if params[:business_id]
      @context = @branch   = Branch.find(params[:branch_id]) if params[:branch_id]
      @context = @person   = Patron.find(params[:person_id]) if params[:person_id]
      @patrons  = @context.patrons if @context
      @patrons ||= Patron.all
    end

    def set_patron
      @patron = Patron.find(params[:id])
    end
end