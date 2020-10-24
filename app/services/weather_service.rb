class WeatherService
  def self.get_forecast_data(zip_code)
    response = Faraday.get("https://api.openweathermap.org/data/2.5/weather?zip=#{zip_code}&units=imperial&appid=#{ENV['WEATHER_API_KEY']}")   
    JSON.parse(response.body, symbolize_names: true)
  end
end