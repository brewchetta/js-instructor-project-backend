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
