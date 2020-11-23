class DestinationFacade
  def self.get_destination_data(id)
    destination = Destination.find(id)
    weather = get_weather(destination)
    image = get_image(weather.summary)
    all_data = all_data(destination, weather, image)
    
    DestinationData.new(all_data)
  end

  def self.get_weather(destination)
    WeatherFacade.get_weather(destination)
  end

  def self.get_image(query)
    image_json = ImageService.get_image(query)
    image_json[:data][0][:images][:original][:url]
  end

  def self.all_data(destination, weather, image)
    all_data = {name: destination.name, zip: destination.zip, description: destination.description, temperature: weather.temperature, high: weather.high, low: weather.low, summary: weather.summary, image_url: image}
  end
end