class AddServiceNotificationCountToServiceRequests < ActiveRecord::Migration[5.0]
  def change
    add_column :service_requests, :service_notifications_count, :integer
  end
end
