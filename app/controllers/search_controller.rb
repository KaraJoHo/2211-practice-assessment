class SearchController < ApplicationController 
  def index 
    conn = Faraday.new(url: "https://developer.nrel.gov") do |faraday| 
      faraday.headers["X-Api-Key"] = ENV["NREL_KEY"]
    end

    response = conn.get("/api/alt-fuel-stations/v1/nearest.json?location=#{params[:location]}&fuel_type=ELEC")

    parsed = JSON.parse(response.body, symbolize_names: true)
    @nearest_station = Station.new(parsed[:fuel_stations].first) 
    # require 'pry'; binding.pry
  end
end