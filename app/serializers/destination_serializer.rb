class DestinationSerializer
  include JSONAPI::Serializer
  attributes :id, :name, :zip, :description, :image_url

end
