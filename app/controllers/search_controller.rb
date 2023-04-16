class SearchController < ApplicationController 
  def index 
    @station_route_info = SearchFacade.new(params[:location]).station_route_info
  end
end