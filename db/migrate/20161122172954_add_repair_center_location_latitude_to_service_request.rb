class AddRepairCenterLocationLatitudeToServiceRequest < ActiveRecord::Migration[5.0]
  def change
    add_column :service_requests, :repair_center_location_latitude, :float
  end
end
