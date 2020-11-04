require 'rails_helper'

RSpec.describe "Destination Show Page" do
  describe "As a Visitor" do
    before :each do
      @dest_1 = Destination.create!( name: 'Denver', zip: '80202', description: 'Some place', image_url: 'https://place-puppy.com/300x300' )
      response = WeatherService.get_weather(@dest_1)
      @weather = Weather.new(response)

    end

    it "Can see destination's info" do
      visit root_path
      within(".dest-#{@dest_1.id}") do
        click_on 'Show'
        expect(current_path).to eq("/destinations/#{@dest_1.id}")
      end

      expect(page).to have_content(@dest_1.name)
      expect(page).to have_content(@dest_1.zip)
      expect(page).to have_content(@dest_1.description)

      within(".forecast") do
        expect(page).to have_content(@weather.temperature)
        expect(page).to have_content(@weather.high)
        expect(page).to have_content(@weather.low)
        expect(page).to have_content(@weather.description)
      end
    end
  end
end
