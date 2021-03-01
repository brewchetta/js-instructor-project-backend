class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token

  private

  def location_params
    params.require(:location).permit(:long, :lat, :name)
  end

end
