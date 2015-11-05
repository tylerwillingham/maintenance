class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.integer :year
      t.string  :make
      t.string  :model
      t.string  :vin
      t.boolean :currently_owned, default: true

      t.timestamps null: false
    end
  end
end
