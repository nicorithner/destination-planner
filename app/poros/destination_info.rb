class DestinationInfo
  attr_reader :destination, :weather, :id
  def initialize(data)
    @destination = data[:destination]
    @weather = data[:weather]
    @id = nil
  end
end