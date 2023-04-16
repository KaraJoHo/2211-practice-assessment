require "rails_helper"

RSpec.describe MapquestService do 
  before(:each) do 
    @service = MapquestService.new
  end

  describe "exists and has an api call", :vcr do 
    it "is a service" do 
      expect(@service).to be_a(MapquestService)
    end

    it "can search for a route" do 
      result = @service.directions("5224 W 25th Ave, Denver, CO 80214", "2027 Depew St, Denver, CO 12345")
      expect(result).to be_a(Hash)
      expect(result.keys).to eq([:route, :info])
      expect(result[:route]).to have_key(:distance)
      expect(result[:route]).to have_key(:formattedTime)
      expect(result[:route]).to have_key(:legs)
      expect(result[:route][:legs]).to be_an(Array)
    end

    it "has a connection to faraday" do 
      expect(@service.conn).to be_a(Faraday::Connection)
    end
  end
end