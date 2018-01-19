class CreateVehicleVisits < ActiveRecord::Migration[5.0]
  def change
    create_table :vehicle_visits do |t|
      t.string :vin

      t.timestamps
    end
  end
end
