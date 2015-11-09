class AddPurchaseDateAndSaleDateToVehicle < ActiveRecord::Migration
  def change
    add_column :vehicles, :purchase_date, :date
    add_column :vehicles, :sale_date, :date
  end
end
