class CreateServiceRequests < ActiveRecord::Migration
  def change
    create_table :service_requests do |t|
      t.integer :car_id
      t.integer :rc_phone
      t.integer :driver_id
      t.string :repair_center_location
      t.string :pickup_location
      t.time :pickup_time
      t.date :pickup_date
      t.string :rc_name

      t.timestamps

    end
  end
end
