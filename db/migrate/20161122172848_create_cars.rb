class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.integer :user_id
      t.string :make
      t.string :model
      t.integer :year
      t.integer :mileage
      t.string :service_history

      t.timestamps

    end
  end
end
