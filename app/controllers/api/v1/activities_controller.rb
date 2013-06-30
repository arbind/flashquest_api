class Api::V1::ActivitiesController < Api::V1::ApplicationController
  before_action :ensure_access_token
  before_action :set_context, only: [:index]
  before_action :set_activity, only: [:show]

  # GET /people/1/activities
  # GET /branches/1/activities
  # GET /businesses/1/activities
  def index
  end

  # GET /activities/1
  def show
  end

  private
    def set_context
      @context = @person   = Person.find(params[:person_id]) if params[:person_id]
      @context = @branches = Branch.find(params[:branch_id]) if params[:branch_id]
      @context = @business = Business.find(params[:business_id]) if params[:business_id]
      @activities = @context.actvities if @context
      @activities ||= Activity.all
    end

    def set_activity
      @activity = Activity.find(params[:id])
    end
end