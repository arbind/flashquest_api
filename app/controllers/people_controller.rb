class PeopleController < ApplicationController
  before_action :set_person, only: [:show]

  # GET /people/1
  # GET /people/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end
end