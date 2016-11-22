class CreateServiceNotifications < ActiveRecord::Migration
  def change
    create_table :service_notifications do |t|
      t.integer :service_request_id
      t.string :status

      t.timestamps

    end
  end
end
