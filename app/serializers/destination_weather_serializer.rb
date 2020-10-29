class DestinationWeatherSerializer
  include JSONAPI::Serializer
  # binding.pry
  attributes :id, :weather, :destination

  # attribute :weather do |object|
  #   object[:weather]
  # end 

  # attribute :destination do |object|
  #   object[:destination]
  # end 
end
