require 'rails_helper'

describe "user can visit the welcome page", :vcr do
  scenario "and see a dropdown menu" do
    visit '/'
    expect(page).to have_content("Nearest Fuel Station")
    expect(page).to have_content("Search For The Nearest Electric Charging Station")
    expect(page).to have_button("Find Nearest Station")
  end

  scenario "can select from the drop down menu and click find to be redirected to a search page" do 
    visit "/"
    select "Griffin Coffee", from: :location
    click_on("Find Nearest Station")

    expect(current_path).to eq("/search")
  end
end
