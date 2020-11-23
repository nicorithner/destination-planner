class DestinationWeatherSerializer
  include JSONAPI::Serializer
  attributes :id, :name, :zip , :description , :temperature , :high, :low, :summary, :image_url
end
