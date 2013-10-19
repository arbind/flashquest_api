class Admin::FactualController < Admin::AdminController
  before_action :set_query

  def index
  end

  private
  def set_query
    @query = FactualQuery.new params[:search]
  end
end
