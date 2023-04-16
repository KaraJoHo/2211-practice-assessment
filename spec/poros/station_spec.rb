require "rails_helper"

RSpec.describe Station do 
  before(:each) do 
    attrs = {
              :access_days_time=>"24 hours daily",
              :fuel_type_code=>"ELEC",
              :station_name=>"Shake Shack - Tesla Supercharger",
              :street_address=>"2027 Depew St",
              :city=>"Denver",
              :state=>"CO",
              :zip=>"12345"
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
      expect(@station.city).to eq("Denver")
      expect(@station.state).to eq("CO")
      expect(@station.zip).to eq("12345")
    end

    it "has a full address" do 
      expect(@station.full_address).to eq("2027 Depew St, Denver, CO 12345")
    end
  end
end