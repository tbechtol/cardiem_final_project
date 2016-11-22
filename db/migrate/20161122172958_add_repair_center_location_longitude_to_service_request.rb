class AddRepairCenterLocationLongitudeToServiceRequest < ActiveRecord::Migration[5.0]
  def change
    add_column :service_requests, :repair_center_location_longitude, :float
  end
end
