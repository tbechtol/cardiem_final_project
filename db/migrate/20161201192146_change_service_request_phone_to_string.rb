class ChangeServiceRequestPhoneToString < ActiveRecord::Migration[5.0]
  def change
    change_column :service_requests, :rc_phone, :string
  end

end
