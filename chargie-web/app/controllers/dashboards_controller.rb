class DashboardsController < ApplicationController
  def dashboard_1
  end

  def dashboard_2
  end

  def dashboard_3
    @extra_class = "sidebar-content"
  end

  def dashboard_4
    render :layout => "layout_2"
  end

  def dashboard_4_1
  end

  def dashboard
    @charging_stations = ChargingStation.all
    @charging_slots = ChargingSlot.where("start_time>= ? AND end_time<= ?", Time.now - 30.days, Time.now)
    @consumption = @charging_slots.sum(:consumption).round(2)
    @price = @charging_slots.sum(:price).round(2)
    @online_stations = @charging_stations.where(status: true).count
    @offline_stations = @charging_stations.where(status: false).count
    @charging_slots_graph = @charging_slots.group("date(charging_slots.end_time)").select('date(charging_slots.end_time) AS date, SUM(consumption) AS consumption')
    @graph_data = @charging_slots_graph.each_with_object([]) do |slot, arry|
      hash = {}
      hash[:date] = slot.date.strftime("%Y-%m-%d")
      hash[:consumption] =  slot.consumption.round(2)
      arry<<hash
    end
  end

end
