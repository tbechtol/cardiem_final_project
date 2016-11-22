class AddRepairCenterLocationFormattedAddressToServiceRequest < ActiveRecord::Migration[5.0]
  def change
    add_column :service_requests, :repair_center_location_formatted_address, :string
  end
end
