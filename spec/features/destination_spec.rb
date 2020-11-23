require 'rails_helper'

RSpec.describe "Destination Show Page" do
  describe "As a Visitor" do
    before :each do
      @dest_1 = Destination.create!( name: 'Denver', zip: '80202', description: 'Some place', image_url: 'https://place-puppy.com/300x300' )
      @destination = DestinationFacade.get_destination_data(@dest_1.id)
    end

    it "Can see destination's info" do
      visit root_path
      within(".dest-#{@dest_1.id}") do
        click_on 'Show'
        expect(current_path).to eq("/destinations/#{@dest_1.id}")
      end

      expect(page).to have_content(@destination.name)
      expect(page).to have_content(@destination.zip)
      expect(page).to have_content(@destination.description)

      within(".forecast") do
        expect(page).to have_content(@destination.temperature)
        expect(page).to have_content(@destination.high)
        expect(page).to have_content(@destination.low)
        expect(page).to have_content(@destination.summary)
      end
    end
  end
end
