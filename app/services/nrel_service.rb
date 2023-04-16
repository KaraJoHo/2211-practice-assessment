class NrelService 

  def station_search(location)
    get_url("/api/alt-fuel-stations/v1/nearest.json?location=#{location}&fuel_type=ELEC")
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn 
    Faraday.new(url: "https://developer.nrel.gov") do |faraday| 
      faraday.headers["X-Api-Key"] = ENV["NREL_KEY"]
    end
  end
end