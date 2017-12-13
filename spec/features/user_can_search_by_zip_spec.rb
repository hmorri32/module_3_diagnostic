require 'rails_helper'

RSpec.feature "User searches" do
  describe "by zip code 80203" do
    before { visit '/'; within('.navbar') { fill_in 'q', with: 80203; click_on "Locate"} }

    it "and clicks locate and its routes to /search with visible params" do
      expect(current_path).to eq(search_path)
      expect(page).to have_current_path("/search?utf8=%E2%9C%93&q=80203&commit=Locate")
    end

    it "returns 10 closest stations within 6 miles and sorted by distance" do

    end
  end
end


## As a user
## When I visit "/"
## And I fill in the search form with 80203
## And I click "Locate"
## Then I should be on page "/search" with parameters visible in the url
## Then I should see a list of the 10 closest stations within 6 miles sorted by distance
## And the stations should be limited to Electric and Propane
## And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times
