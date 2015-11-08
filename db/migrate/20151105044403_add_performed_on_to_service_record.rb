class AddPerformedOnToServiceRecord < ActiveRecord::Migration
  def change
    add_column :service_records, :performed_on, :date
  end
end
