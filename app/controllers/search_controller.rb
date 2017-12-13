class SearchController < ApplicationController
  def index
    @service  = NrelService.new(params[:q])
    @stations = @service.closest_stations.map do |station|
      Station.new(station)
    end
  end
end
