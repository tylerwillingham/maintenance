class CreateServiceRecords < ActiveRecord::Migration
  def change
    create_table :service_records do |t|
      t.integer :vehicle_id
      t.string :subject
      t.decimal :mileage

      t.timestamps null: false
    end
  end
end
