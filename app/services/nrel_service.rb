class NrelService
  def initialize(zip_code=80203)
    @zip_code = zip_code
    @client   = configure_faraday
  end

  def configure_faraday
    Faraday.new("https://developer.nrel.gov") do |f|
      f.adapter Faraday.default_adapter
    end
  end

  def closest_stations
    get_json("/api/alt-fuel-stations/v1/nearest.json?api_key=#{ENV['NREL_API_KEY']}&location=#{zip_code}&limit=10&distance=6&fuel_types=ELEC,LPG")[:fuel_stations]
  end

  private
    attr_reader :client, :zip_code

    def get_json(url)
      response = client.get(url)
      JSON.parse(response.body, symbolize_names: true)
    end
end
