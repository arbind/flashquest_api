class Admin::FactualController < Admin::AdminController
  before_action :set_query

  def index
  end

  private
  def set_query
    query_params = params[:search] || {}
    @query = FactualQuery.new query_params
  end
end
