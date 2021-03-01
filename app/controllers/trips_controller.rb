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
    location = Location.find_by(name: params[:trip][:location])
    if !location
      geocoded_location = Geocoder.search(params[:location] || params[:trip][:location])
      location = Location.create({
        name: params[:location] || params[:trip][:location],
        lat: geocoded_location.first&.coordinates[0],
        long: geocoded_location.first&.coordinates[1]
      })
    end
    trip = location.trips.build(trip_params)
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
    params.require(:trip).permit(:name, :content, :user_id, :location_id, :date)
  end

  def find_trip
    @trip = Trip.find_by_id(params[:id])
  end

end
