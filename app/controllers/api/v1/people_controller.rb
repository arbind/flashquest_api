class Api::V1::PeopleController < Api::V1::ApplicationController
  before_action :ensure_access_token
  before_action :set_person, only: [:show]
  before_action :set_people, only: [:index]

  # GET /people
  # GET /branches/1/people
  # GET /businesses/1/people
  def index
    render :index if @people
    render :index_for_patrons if @patrons
  end

  # GET /people/1
  def show
  end

  private
    def set_people
      @context = @business = Business.find(params[:business_id]) if params[:business_id]
      @context = @branch   = Branch.find(params[:branch_id]) if params[:branch_id]
      return @people  = @context.people if @context and @context.respond_to? :people
      return @patrons = @context.patrons if @people.nil? and @context.respond_to? :patrons
      @people = Person.all
    end

    def set_person
      @person = Person.find(params[:id])
    end
end