class AddNameToDriverTable < ActiveRecord::Migration[5.0]
  def change
    add_column :drivers, :first_name, :string
    add_column :drivers, :last_name, :string
  end
end
