class WeatherService

  def self.get_weather(destination)
    response = conn.get('data/2.5/weather') do |f|
      f.params[:appid] = ENV['WEATHER_API_KEY']
      f.params[:zip] = destination.zip
      f.params[:units] = 'imperial'
    end
    JSON.parse(response.body, symbolize_names: :true)
  end


  private

  def self.conn
    Faraday.new('https://api.openweathermap.org/')
  end
  
end
