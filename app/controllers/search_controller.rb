class SearchController < ApplicationController 
  def index 
    # @nearest_station = SearchFacade.new(params[:location]).station_search 
    # @route = SearchFacade.new(params[:location]).directions
    @station_route_info = SearchFacade.new(params[:location]).station_route_info
  end
end