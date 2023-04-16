require "rails_helper"

RSpec.describe Route do 
  before(:each) do 
    attrs = {:sessionId=>"AHIA5wcAAGIAAAAAAAAAEQAAAIoAAAB42mPoYmBgZGJgYGDPSC1KtUrOFVHSNAByGdwfVk3h0Kj2NmW66BKjDqUZsACYxjtrIRovuorHMgic8jLVf-McIwikDYA0Aw7Qa1zbpgekFTQZGgQYANDLGk7YK2d2:car",
    :realTime=>118,
    :distance=>0.6997,
    :time=>114,
    :formattedTime=>"00:01:54",
    :legs=>
      [{
        :distance=>0.6997,
        :time=>118,
        :formattedTime=>"00:01:58",
        :maneuvers=>
        [{
          :narrative=>"Head east on W 25th Ave. Go for 246 ft.",
          },

          {
          :narrative=>"Turn right onto Sheridan Blvd (CO-95). Go for 0.4 mi." 
          }]
        }
      ]
    }
    @route = Route.new(attrs)
  end

  describe "route" do 
    it "exists and has attributes" do 
      expect(@route).to be_a(Route)
      expect(@route.distance).to eq(0.6997)
      expect(@route.travel_time).to eq("00:01:54")
      expect(@route.instructions).to eq("Head east on W 25th Ave. Go for 246 ft. Turn right onto Sheridan Blvd (CO-95). Go for 0.4 mi.")
    end

    it "is a list of maneuvers" do 
      expect(@route.all_maneuvers).to eq("Head east on W 25th Ave. Go for 246 ft. Turn right onto Sheridan Blvd (CO-95). Go for 0.4 mi.")
    end
  end
end