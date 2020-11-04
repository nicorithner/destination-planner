class DestinationData
  attr_reader :name, :zip , :description , :temperature , :high, :low, :summary, :image_url
  def initialize(data)
    @id = nil
    @name = data[:name]
    @zip = data[:zip]
    @description = data[:description]
    @temperature = data[:temperature].round
    @high = data[:high].round
    @low = data[:low].round
    @summary = data[:summary]
    @image_url = data[:image_url]
  end
end