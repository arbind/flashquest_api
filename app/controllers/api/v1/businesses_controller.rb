class Api::V1::BusinessesController < Api::V1::ApplicationController
  before_action :ensure_access_token
  before_action :set_business,   only: [:show]
  before_action :set_businesses, only: [:index]

  # GET /businesses
  # GET /person/:id/businesses
  def index
  end

  # GET /businesses/1
  def show
  end

  private
    def set_businesses
      @context      = @person = Person.find(params[:person_id]) if params[:person_id]
      @businesses   = @context.businesses if @context
      @businesses ||= Business.all
    end

    def set_business
      @person = Person.find(params[:person_id]) if params[:person_id]
      @patron = Patron.find(params[:patron_id]) if params[:patron_id]
      @business = Business.find(params[:id])
    end
end
