class WeatherFacade
  def self.get_weather(destination)
    response = WeatherService.get_weather(destination)
    Weather.new(response)
  end
end