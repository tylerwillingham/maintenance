class AddMileageToServiceRecord < ActiveRecord::Migration
  def change
    add_column :service_records, :mileage, :decimal
  end
end
