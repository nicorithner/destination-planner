class DestinationData
  attr_reader :name, :zip , :description , :temperature , :high, :low, :summary, :image_url
  def initialize(data)
    @name = data[:name]
    @zip = data[:zip]
    @description = data[:description]
    @temperature = data[:temperature]
    @high = data[:high]
    @low = data[:low]
    @summary = data[:summary]
    @image_url = data[:image_url]
  end
end