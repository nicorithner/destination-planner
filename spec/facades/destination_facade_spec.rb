require 'rails_helper'

RSpec.describe "DestinationFacade" do
  it "It has the destination's details" do
    data = Destination.create!(id: "1", name: 'Denver', zip: '80202', description: 'Some place')
    @destination_data = DestinationFacade.get_destination_data(data[:id])

    expect(@destination_data).to be_a(Destination)
    expect(@destination_data.name).to be_a(String)
    expect(@destination_data.zip).to be_a(String)
    expect(@destination_data.description).to be_a(String)
    expect(@destination_data.temperature).to be_a(Numeric)
    expect(@destination_data.high).to be_a(Numeric)
    expect(@destination_data.low).to be_a(Numeric)
    expect(@destination_data.summary).to be_a(String)
    expect(@destination_data.image_url).to be_a(String)
  end
end