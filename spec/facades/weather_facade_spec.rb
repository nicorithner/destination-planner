require 'rails_helper'

RSpec.describe "Weather Facade" do
  it "it has destination weather" do
    destination = Destination.create!( name: 'Denver', zip: '80202', description: 'Some place', image_url: 'https://place-puppy.com/300x300' )
    weather = WeatherFacade.get_weather(destination)

    expect(weather).to be_a(Weather)
    expect(weather.temperature).to be_a(Numeric)
    expect(weather.high).to be_a(Numeric)
    expect(weather.low).to be_a(Numeric)
    expect(weather.description).to be_a(String)
  end
end