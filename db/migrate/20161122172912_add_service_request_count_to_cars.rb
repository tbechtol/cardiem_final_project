class AddServiceRequestCountToCars < ActiveRecord::Migration[5.0]
  def change
    add_column :cars, :service_requests_count, :integer
  end
end
