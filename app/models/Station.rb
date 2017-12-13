class Station
  attr_reader :fuel_type_code, :city, :station_name, :state, :distance

  def initialize(data)
    @fuel_type_code = data[:fuel_type_code]
    @city           = data[:city]
    @station_name   = data[:station_name]
    @state          = data[:state]
    @distance       = data[:distance]
    #TODO -> more attributes.
  end
end