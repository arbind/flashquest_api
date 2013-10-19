require 'factual'

class FactualQuery

  attr_reader :term, :location, :country, :country_code, :wifi, :rated

  def initialize(query_params={})
    @term = query_params[:term].to_s.squish
    @location = query_params[:location].to_s.squish
    @country = query_params[:country] || 'United States'
    @country_code = CountrySelect::COUNTRIES.invert[@country]
    @wifi = query_params[:wifi]
    @rated = query_params[:rated]

    # @scope = factual.table("restaurants")
    @scope = factual.table("places")  # supported countries (like th) seem to have places, not restaurants

    filter
    search
    sort
    paginate
  end

  def filter
    filter = {}
    filter['wifi'] = true if @wifi
    filter['rating'] = {"$gte" => 4} if @rated
    filter['locality'] = @location if @location.present?
    filter['country'] = @country_code
    @scope = @scope.filters filter if filter.any?
  end

  def search
    @scope = @scope.search(@term) if @term.present?
  end

  def sort
    @scope.sort_desc('rating')
  end

  def paginate
    # +++
  end

  def results
    if @scope
      @results = @scope.rows
    else
      @results = []
    end
  end

private
  def factual
    @factual ||= Factual.new(FACTUAL_KEY, FACTUAL_SECRET)
  end
end