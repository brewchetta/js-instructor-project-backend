class LocationsController < ApplicationController

  def index
    locations = Location.all
    render json: locations
  end

  def show
    location = Location.find_by_id(params[:id])
    render json: location
  end

  def create
    location = Location.new(location_params)
    location.lat ||= Geocoder.search(params[:location][:name]).first.coordinates[0]
    location.long ||= Geocoder.search(params[:location][:name]).first.coordinates[1]
    if location.save
      render json: location
    else
      render json: {
        error: location.errors.full_messages,
        status: 406
      }, status: 406
    end
  end

  def delete
    location = Location.find(params[:id])
    location.destroy
    render json: location
  end

end
