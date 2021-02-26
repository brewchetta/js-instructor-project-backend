class TripsController < ApplicationController
  before_action :find_trip, only: [:show, :update, :destroy]

  def index
    trips = Trip.all
    render json: trips
  end

  def show
    render json: @trip
  end

  def create
    location = Location.find_by_id(params[:location_id])
    trip = Trip.new(trip_params)
    if trip.save
      render json: trip
    else
      render json: {
        error: trip.errors.full_messages,
        status: 406
      }, status: 406
    end
  end

  def update
    if @trip.update(trip_params)
      render json: @trip
    else
      render json: {
        error: @trip.errors.full_messages,
        status: 406
      }, status: 406
    end
  end

  def destroy
    @trip.destroy
    render json: @trip
  end

  private

  def trip_params
    params.require(:trip).permit(:long, :lat, :name)
  end

  def find_trip
    @trip = Trip.find_by_id(params[:id])
  end

end
