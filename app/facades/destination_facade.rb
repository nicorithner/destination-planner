class DestinationFacade
  def self.get_destination_data(id)
    destination = Destination.find(id)
    weather = WeatherFacade.get_weather(destination)
    image_json = ImageService.get_image(weather.summary)
    image = image_json[:data][0][:images][:original][:url]
    
    all_data = {name: destination.name, zip: destination.zip, description: destination.description, temperature: weather.temperature, high: weather.high, low: weather.low, summary: weather.summary, image_url: image}

    DestinationData.new(all_data)
  end
end