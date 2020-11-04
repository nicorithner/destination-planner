class ImageService

  def self.get_image(data)
    response = conn.get('v1/gifs/search') do |f|
      f.params[:api_key] = ENV['GIF_API_KEY']
      f.params[:q] = data
      f.params[:limit] = 1
      f.params[:rating] = 'pg-13'
    end
    JSON.parse(response.body, symbolize_names: :true)
  end

  private

  def self.conn
    Faraday.new('https://api.giphy.com/')
  end
end