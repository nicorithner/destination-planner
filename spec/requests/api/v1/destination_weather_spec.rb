require 'rails_helper'
RSpec.describe "External Endpoints for Destination Weather" do
  
  it "Exposes destination attributes" do
    destination = Destination.create!( name: 'Denver', zip: '80202', description: 'Some place', image_url: 'https://place-puppy.com/300x300' )

    get "/api/v1/destination_weather/#{destination.id}"
    json = JSON.parse(response.body, symbolize_names: true)

    expect(json).to have_key(:data)
    expect(json[:data][:attributes]).to have_key(:name)
    expect(json[:data][:attributes]).to have_key(:zip)
    expect(json[:data][:attributes]).to have_key(:image_url)
  end

end