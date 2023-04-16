require "rails_helper"

RSpec.describe SearchFacade do 
  before(:each) do 
    @facade = SearchFacade.new("Griffin Coffee")
  end

  describe "Search Facade", :vcr do 
    it "exists" do 
      expect(@facade).to be_a(SearchFacade)
    end

    it "has a full address" do 
      expect(@facade.route_start).to be_a(String)
    end

    it "has a station search call" do 
      expect(@facade.station_search).to be_a(Station)
    end

    it "has a directions search call" do 
      expect(@facade.directions).to be_a(Route)
      expect(@facade.directions.distance).to be_a(Float)
    end

    it "has the station and route info in a hash" do 
      expect(@facade.station_route_info).to be_a(Hash)
      expect(@facade.station_route_info.keys).to eq([:station, :route])
    end
  end
end