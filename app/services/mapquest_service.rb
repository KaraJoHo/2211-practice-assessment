class MapquestService 
  def directions(location, route_arrival)
    get_url("/directions/v2/route?key=#{ENV["MAPQUEST_KEY"]}&from=#{location}&to=#{route_arrival}")
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn 
    Faraday.new(url: "https://www.mapquestapi.com")
  end
end