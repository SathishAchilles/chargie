class ChargingStationsController < ApplicationController
  def new
    @charging_station = ChargingStation.new
  end

  def edit
  end

  def create
    @charging_station  = ChargingStation.new(charge_station_params)
    respond_to do |format|
      @charging_station.save!
      format.html { redirect_to dashboard_url }
    end
  end

  private

  def charge_station_params
    params.require(:charging_station).permit(:name, :address, :latitude, :longitude, :status, :capacity, :unit, :charger_type)
  end
end
