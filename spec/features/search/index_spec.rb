require "rails_helper"

RSpec.describe "Search" do 
  before(:each) do 
    visit "/"
    select "Griffin Coffee", from: :location
    click_on("Find Nearest Station")
  end

  describe "search resutls", :vcr do 
    it "has the closest electric fuel station with name, address, fuel type and access time" do
      within(".station_info") do 
        expect(page).to have_content("Name: Shake Shack - Tesla Supercharger")
        expect(page).to have_content("Address: 2027 Depew St")
        expect(page).to have_content("Fuel Type: ELEC")
        expect(page).to have_content("Access Time: 24 hours daily")
      end
    end

    it "has the distance of the nearest station" do 

    end

    it "has the travel time from the searched location to the nearest station" do 
      
    end

    it "has the directions to get to the station" do 
      
    end
  end
end