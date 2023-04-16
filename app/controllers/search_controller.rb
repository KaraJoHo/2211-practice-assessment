class SearchController < ApplicationController 
  def index 
    conn = Faraday.new(url: "https://developer.nrel.gov") do |faraday| 
      faraday.headers["X-Api-Key"] = ENV["NREL_KEY"]
    end

    response = conn.get("/api/alt-fuel-stations/v1/nearest.json?location=#{params[:location]}&fuel_type=ELEC")

    parsed = JSON.parse(response.body, symbolize_names: true)

    @nearest_station = Station.new(parsed[:fuel_stations].first) 
    

    route_conn = Faraday.new(url: "https://www.mapquestapi.com")

    route_response = route_conn.get("/directions/v2/route?key=#{ENV["MAPQUEST_KEY"]}&from=#{params[:location]}&to=#{@nearest_station.full_address}")

    parsed_route = JSON.parse(route_response.body, symbolize_names: true)
    @route = Route.new(parsed_route[:route])
  end
end