class AddPickupLocationLongitudeToServiceRequest < ActiveRecord::Migration[5.0]
  def change
    add_column :service_requests, :pickup_location_longitude, :float
  end
end
