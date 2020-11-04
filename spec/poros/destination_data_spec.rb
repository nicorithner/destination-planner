require 'rails_helper'

RSpec.describe DestinationData do
  it "DestinationData has all destination attributes" do
    destination = { id: "1", name: 'Denver', zip: '80202', description: 'Some place', temperature: 50, high: 70, low: 40, summary: 'cloudy with chances of meatballs', image_url: 'https://place-puppy.com/300x300' }

    @destination_data = DestinationData.new(destination)

    expect(@destination_data).to be_a(DestinationData)
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