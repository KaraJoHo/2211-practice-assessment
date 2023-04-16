class SearchFacade 

  attr_reader :route_arrival

  def initialize(location)
    @location = location
    @route_arrival = station_search.full_address
  end

  def station_search
    parsed = nrel_service.station_search(@location)
    Station.new(parsed[:fuel_stations].first) 
  end

  def directions 
    parsed_route = mapquest_service.directions(@location, @route_arrival)
    Route.new(parsed_route[:route])
  end

  def station_route_info 
    info_hash = {}

    info_hash[:station] = station_search
    info_hash[:route] = directions

    info_hash 
  end

  def nrel_service 
    @nrel_service ||= NrelService.new
  end

  def mapquest_service 
    @mapquest_service ||= MapquestService.new
  end
end