class ImageService
  def self.get_image_api(query)
    response = Faraday.get("https://api.giphy.com/v1/gifs/search?api_key=#{ENV['GIF_API_KEY']}&q=#{query}&limit=1&rating:pg-13")
    JSON.parse(response.body, symbolize_names: true)
  end
end