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
        expect(page).to have_css(".name", count: 1)
        expect(page).to have_css(".address", count: 1)
        expect(page).to have_css(".fuel", count: 1)
        expect(page).to have_css(".access_time", count: 1)
      end
    end

    it "has the distance of the nearest station" do 
      within(".route_info") do 
        expect(page).to have_content("Distance: 0.69")
        expect(page).to_not have_content("Distance: 5.70")
      end
    end

    it "has the travel time from the searched location to the nearest station" do 
      within(".route_info") do 
        expect(page).to have_content("Travel Time: 00:01:54")
        expect(page).to_not have_content("Travel Time: 00:50:54")
      end
    end

    it "has the directions to get to the station" do 
      within(".route_info") do 
        expect(page).to have_content("Directions: Head east on W 25th Ave. Go for 246 ft. Turn right onto Sheridan Blvd (CO-95). Go for 0.4 mi.")
        expect(page).to_not have_content("Turn up")
      end
    end
  end
end