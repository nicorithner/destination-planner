require 'rails_helper'

RSpec.describe Weather do
  it "Has attributes" do
    data = 
      {
        "weather": 
        [
          {
            "id": 802,
            "main": "Clouds",
            "description": "scattered clouds",
            "icon": "03d"
          }
        ],
        "main": 
        {
          "temp": 70.5,
          "feels_like": 64.17,
          "temp_min": 68,
          "temp_max": 72,
          "pressure": 1013,
          "humidity": 17
        }
      }

    weather = Weather.new(data)

    expect(weather).to be_a(Weather)
    expect(weather.temperature).to be_a(Numeric)
    expect(weather.high).to be_a(Numeric)
    expect(weather.low).to be_a(Numeric)
    expect(weather.summary).to be_a(String)
  end
end