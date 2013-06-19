class BusinessesController < ApplicationController
  before_action :set_business,   only: [:show]
  before_action :set_businesses, only: [:index]

  # GET /businesses
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
      @business = Business.find(params[:id])
    end
end
