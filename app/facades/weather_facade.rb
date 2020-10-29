class WeatherFacade
  def self.get_forecast(zip)
    results = WeatherService.get_forecast_data(zip)
    # destination_data =  {temp: results[:main][:temp], temp_min: results[:main][:temp_min], temp_max: results[:main][:temp_max], description: results[:weather][0][:description] }

    Weather.new(results)
    # Weather.new(destination_data)
  end
end