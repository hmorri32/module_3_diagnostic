class NrelService
  def initialize(zip_code=80203)
    @zip_code = zip_code
    @client   = configure_faraday
  end

  def configure_faraday
    Faraday.new("https://developer.nrel.gov") do |f|
      f.adapter Faraday.default_adapter
      # f.params[:api_key]    = ENV['NREL_API_KEY']
      # f.params[:location]   = zip_code
      # f.params[:limit]      = 10
      # f.params[:distance]   = 6
      # f.params[:fuel_types] = 'ELEC, LPG'
    end
  end

  # https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?api_key=0Bw0RAsakXPN1kquKkdAIge2pzhgDbqLiaLtSzMF&location=80203&limit=10&distance=6&fuel_types=ELEC,LPG

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
