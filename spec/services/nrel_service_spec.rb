require "rails_helper"

RSpec.describe NrelService do 
  before(:each) do 
    @service = NrelService.new
  end

  describe "exists and has an api call", :vcr do 
    it "is a service" do 
      expect(@service).to be_a(NrelService)
    end

    it "has a station_search call" do 
      result = @service.station_search("Griffin Coffee")
      expect(result).to be_a(Hash)
      expect(result).to have_key(:fuel_stations)
      expect(result[:fuel_stations]).to be_an(Array)
    end

    it "has a connection to faraday" do 
      expect(@service.conn).to be_a(Faraday::Connection)
    end
  end
end