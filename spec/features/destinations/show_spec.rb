require 'rails_helper'
RSpec.describe "Destinations Show Page" do
  describe "As a Visitor" do
    describe "In 'destionations/:id'" do
      before :each do
        @dest_1 = Destination.create!(name: Faker::Address.city, zip: Faker::Address.zip, description: Faker::Lorem.sentence, image_url: Faker::Placeholdit.image)
        @dest_2 = Destination.create!(name: Faker::Address.city, zip: Faker::Address.zip, description: Faker::Lorem.sentence, image_url: Faker::Placeholdit.image)
        @dest_3 = Destination.create!(name: Faker::Address.city, zip: Faker::Address.zip, description: Faker::Lorem.sentence, image_url: Faker::Placeholdit.image)
        
        @weather = WeatherFacade.get_forecast(@destination.zip)

        visit '/'
        within(".row") do
          expect(page).to have_content(@dest_1.name)
          within(".dest-#{@dest_1.id}") do
            click_link('Show')
          end
        end
      
      end
      it "I should see the destination's name, zipcode, description, and current weather" do
        expect(page).to have_content(@dest_1.name)
        expect(page).to have_content(@dest_1.zip)
        expect(page).to have_content(@dest_1.description)
        expect(page).to have_content("Forecast for #{@dest_1.name}:")
      end

      it "The weather forecast is specific to the destination whose page I'm on" do

        # expect(page).to have_content("Today's Date Here weekday, month, day")
        expect(page).to have_content("Max Temperature: #{@weather.temp_max} F - Min Temperature: #{@weather.temp_min} F")
        expect(page).to have_content("Summary: #{@weather.description}")

      end
    end
  end
end

#The forecast should include date (weekday, month and day), current, high and low temps in Fahrenheit, and a summary (for example "light rain", "clear sky", etc.)
# As a user
# When I visit "/"
# And I click on a destination
# Then I should be on page "/destinations/:id"
# Then I should see the destination's name, zipcode, description, and current weather
# The weather forecast is 
#   - [ ] specific to the destination whose page I'm on
#   - [ ] The forecast should include date (weekday, month and day), 
#   - [ ] Current, high and low temps in Fahrenheit, and a 
#   - [ ] summary (for example "light rain", "clear sky", etc.)