require 'rails_helper'

describe 'Expose RESTful API endpoints for Destinations' do
  it "Send a list of destinations" do
    Destination.create!( name: 'Denver', zip: '80202', description: 'Some place', image_url: 'https://place-puppy.com/300x300' )
    Destination.create!( name: 'Denver', zip: '80202', description: 'Another place', image_url: 'https://place-puppy.com/300x300' )
    Destination.create!( name: 'Denver', zip: '80202', description: 'This place', image_url: 'https://place-puppy.com/300x300' )

    get '/api/v1/destinations'
    
    expect(response).to be_successful
    rsp = JSON.parse(response.body, symbolize_names: :true)

    expect(rsp).to be_a(Hash)
    expect(rsp[:data]).to be_an(Array)
    expect(rsp[:data][0].keys).to eq([:id, :type, :attributes])

    rsp[:data].each do |destination|
      expect(destination).to have_key(:type)
      expect(destination[:type]).to be_a(String)
      expect(destination[:attributes]).to have_key(:description)
      expect(destination[:attributes][:description]).to be_a(String)
    end
  end

  it "can get one destination by its id" do
    dest_1 = Destination.create!( name: 'Denver', zip: '80202', description: 'Some place', image_url: 'https://place-puppy.com/300x300' )

    get "/api/v1/destinations/#{dest_1.id}"
    rsp = JSON.parse(response.body, symbolize_names: true)
    
    expect(response).to be_successful
    expect(rsp).to be_instance_of(Hash)
    expect(rsp.keys.first).to eq(:data)
    expect(rsp[:data][:id]).to eq("#{dest_1.id}")
  end

  it "Can create a new destination" do
    destination_params = {name: 'Denver', zip: '80202', description: 'Some place', image_url: 'https://place-puppy.com/300x300'}
    post "/api/v1/destinations", params: destination_params

    rsp = JSON.parse(response.body, symbolize_names: :true)
    expect(response).to be_successful

    expect(rsp[:data][:attributes][:name]).to eq(destination_params[:name])
    expect(rsp[:data][:attributes][:description]).to eq(destination_params[:description])
  end

  it "can update a destination" do
    dest_1 = Destination.create!( name: 'Denver', zip: '80202', description: 'Some place', image_url: 'https://place-puppy.com/300x300' )
    destination_name = Destination.first.name
    destination_params = { "name": 'Golden' }
    
    patch "/api/v1/destinations/#{dest_1.id}", params: destination_params
    
    rsp = JSON.parse(response.body, symbolize_names: true)
    
    destination = Destination.find_by(id: dest_1.id)
    
    updated_destination = rsp[:data]
    expect(updated_destination[:attributes][:name]).to eq(destination.name)
    expect(updated_destination[:attributes][:description]).to eq(destination.description)
    expect(updated_destination[:attributes][:name]).to_not eq(destination_name)
  end

  it "can destroy a destination" do
    dest_1 = Destination.create!( name: 'Denver', zip: '80202', description: 'Some place', image_url: 'https://place-puppy.com/300x300' )

    expect {delete "/api/v1/destinations/#{dest_1.id}"}.to change {Destination.count}.by(-1)

    expect(response).to be_successful
    expect(response.status).to eq(204)

  end
end