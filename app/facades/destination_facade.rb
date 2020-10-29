class DestinationFacade
  def self.destination(id)
    destination = Destination.find(id)
    weather = WeatherFacade.get_forecast(destination.zip)
    destination.update(image_url: get_image(weather.description) )
    DestinationInfo.new({destination: destination, weather: weather})
  end

  def self.get_image(query)
    url = Image.new(ImageService.get_image_api(query))
    url.image_url
  end

  def id
    nil
  end
end
