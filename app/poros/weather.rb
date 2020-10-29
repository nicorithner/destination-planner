class Weather
  attr_reader :temp, :temp_max, :temp_min, :description
  def initialize(data)
    @temp = data[:main][:temp].round
    @temp_max = data[:main][:temp_max]
    @temp_min = data[:main][:temp_min]
    @description = data[:weather][0][:description]
  end
end