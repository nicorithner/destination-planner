require 'rails_helper'

RSpec.describe "ImageService" do
  it "It returns Image info for destination" do
    weather_summary = "cloudy"
    image = ImageService.get_image(weather_summary)

    expect(image).to be_a(Hash)
    expect(image[:data][0][:images][:original]).to have_key(:url)
    expect(image[:data][0][:images][:original][:url]).to be_a(String)
  end
end