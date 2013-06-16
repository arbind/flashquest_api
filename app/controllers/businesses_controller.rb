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
      @businesses ||= Business.all
    end

    def set_business
      @business = Business.find(params[:id])
    end
end
