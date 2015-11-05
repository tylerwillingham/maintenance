class AddMileageToVehicle < ActiveRecord::Migration
  def change
    add_column :vehicles, :mileage, :decimal
  end
end
