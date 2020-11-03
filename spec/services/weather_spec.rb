require 'rails_helper'

RSpec.describe "WeatherService" do
  it "It returns weather info for destination" do
    @dest_1 = Destination.create!( name: 'Denver', zip: '80202', description: 'Some place', image_url: 'https://place-puppy.com/300x300' )
    weather = WeatherService.get_weather(@dest_1)

    expect(weather).to be_a(Hash)
    expect(weather).to have_key(:weather)
    expect(weather[:weather][0]).to have_key(:description)
    expect(weather[:main]).to have_key(:temp_min)
    expect(weather[:main]).to have_key(:temp_max)

  end
end