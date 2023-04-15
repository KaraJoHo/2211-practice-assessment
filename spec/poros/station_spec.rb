require "rails_helper"

RSpec.describe Station do 
  before(:each) do 
    attrs = {
              :access_days_time=>"24 hours daily",
              :fuel_type_code=>"ELEC",
              :station_name=>"Shake Shack - Tesla Supercharger",
              :street_address=>"2027 Depew St"
            }
  @station = Station.new(attrs)
  end

  describe "station" do 
    it "exists and has attributes" do 
      expect(@station).to be_a(Station)
      expect(@station.name).to eq("Shake Shack - Tesla Supercharger")
      expect(@station.fuel_type).to eq("ELEC")
      expect(@station.address).to eq("2027 Depew St")
      expect(@station.access_time).to eq("24 hours daily")
    end
  end
end