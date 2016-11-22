class AddCarCountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :cars_count, :integer
  end
end
