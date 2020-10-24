class Weather
  attr_reader :temp, :temp_max, :temp_min, :description
  def initialize(data)
    @temp = data[:temp].round
    @temp_max = data[:temp_max]
    @temp_min = data[:temp_min]
    @description = data[:description]
  end
end