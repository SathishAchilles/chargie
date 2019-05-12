class ChargingSlotsController < ApplicationController
  def create
      raise StandardError.new("Start_time is require") unless params['start_time'].present?
      charging_slot = ChargingSlot.new
      charging_slot.start_time = Time.parse(params['start_time'])
      charging_slot.end_time = Time.parse(params['end_time'])
      charging_slot.consumption = 68.8
      charging_slot.unit = 'kW'
      charging_slot.price = 96.75
      charging_slot.charging_station_id = ChargingStation.first.id
      charging_slot.vehicle_id = Vehicle.first.id
      charging_slot.save!
      render json: { message: 'Success', charging_slot: charging_slot }, status: 200
  rescue StandardError => ex
      render json: { error: ex.message }, status: 422
  end
end
