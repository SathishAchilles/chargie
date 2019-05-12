class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.string :model_number
      t.string :model_type
      t.string :charge_percent

      t.timestamps null: false
    end
  end
end
