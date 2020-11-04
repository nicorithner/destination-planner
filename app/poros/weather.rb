class Weather
  attr_reader :temperature, :high, :low, :description
  def initialize(data)
    @temperature = data[:main][:temp]
    @high = data[:main][:temp_max]
    @low = data[:main][:temp_min]
    @description = data[:weather][0][:description]
  end
end