class Api::V1::DestinationWeatherController < ApplicationController
  def show
    destination = DestinationFacade.get_destination_data(params[:id])
    render json: DestinationWeatherSerializer.new(destination)
  end
end