class Api::V1::DestinationWeatherController < ApplicationController
  def show
    destination_data = DestinationFacade.destination(params[:id])
    render json: DestinationWeatherSerializer.new(destination_data)
  end
end