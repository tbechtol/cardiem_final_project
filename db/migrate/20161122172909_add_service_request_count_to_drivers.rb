class AddServiceRequestCountToDrivers < ActiveRecord::Migration[5.0]
  def change
    add_column :drivers, :service_requests_count, :integer
  end
end
