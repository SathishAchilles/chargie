class CreateChargingSlots < ActiveRecord::Migration
  def change
    create_table :charging_slots do |t|
      t.integer :minutes
      t.decimal :price
      t.datetime :start_time, null: false
      t.datetime :end_time, null: false
      t.integer :minutes
      t.decimal :price
      t.float :consumption
      t.text :consumption_unit
      t.references :charging_slots, :vehicles, index: true

      t.timestamps null: false
    end
  end
end
