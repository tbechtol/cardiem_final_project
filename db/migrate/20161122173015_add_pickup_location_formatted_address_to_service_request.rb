class AddPickupLocationFormattedAddressToServiceRequest < ActiveRecord::Migration[5.0]
  def change
    add_column :service_requests, :pickup_location_formatted_address, :string
  end
end
