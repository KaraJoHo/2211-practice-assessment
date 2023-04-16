class SearchFacade 

  attr_reader :route_start

  def initialize(location)
    @location = location
    @route_start = station_search.full_address
  end

  def station_search
    conn = Faraday.new(url: "https://developer.nrel.gov") do |faraday| 
      faraday.headers["X-Api-Key"] = ENV["NREL_KEY"]
    end

    response = conn.get("/api/alt-fuel-stations/v1/nearest.json?location=#{@location}&fuel_type=ELEC")

    parsed = JSON.parse(response.body, symbolize_names: true)

    Station.new(parsed[:fuel_stations].first) 
  
  end

  def directions 
    route_conn = Faraday.new(url: "https://www.mapquestapi.com")

    route_response = route_conn.get("/directions/v2/route?key=#{ENV["MAPQUEST_KEY"]}&from=#{@location}&to=#{@route_start}")

    parsed_route = JSON.parse(route_response.body, symbolize_names: true)
    Route.new(parsed_route[:route])
  end

  def station_route_info 
    info_hash = {}

    info_hash[:station] = station_search
    info_hash[:route] = directions

    info_hash 
  end
end