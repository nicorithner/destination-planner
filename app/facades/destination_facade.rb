class DestinationFacade
  # Here I want to gather everything related to the destination:
  #     - destination data including image.
  #     - destination weather data from the weather facade.

  def self.get_image(query)
    url = ImageService.get_image_api(query)
    Image.new(url)
  end
end