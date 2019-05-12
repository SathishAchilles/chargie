class CreateChargingStations < ActiveRecord::Migration
  def change
    create_table :charging_stations do |t|
      t.string :name, null: false
      t.string :address
      t.string :latitude
      t.string :longitude
      t.datetime :last_serviced
      t.boolean :status
      t.float :capacity
      t.string :unit
      t.string :charger_type

      t.timestamps null: false
    end
  end
end
