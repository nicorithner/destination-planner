class Image
  attr_reader :image_url
  def initialize(data)
    @image_url = data[:data][0][:images][:original][:url]
  end
end