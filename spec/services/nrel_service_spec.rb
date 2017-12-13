require 'rails_helper'

RSpec.describe NrelService do
  let!(:nrel) { NrelService.new }

  describe "initialize" do
    it "returns an instance" do
      expect(nrel).to be_a(NrelService)
    end
  end

  describe "class methods" do
    describe "#closest_stations" do
      it "returns the ten closest stations" do
       VCR.use_cassette('nrel_service/closest_stations', :match_requests_on => [:method]) do
          stations = nrel.closest_stations[:fuel_stations]
          expect(stations.length).to eq(10)
          # COOOL!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        end
      end
    end
  end
end