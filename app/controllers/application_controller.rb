class ApplicationController < ActionController::Base

  private

  def location_params
    params.require(:location).permit(:long, :lat, :name)
  end

end
