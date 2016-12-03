class AddCarNameColumnToCarsTable < ActiveRecord::Migration[5.0]
  def change
      add_column :cars, :nickname, :string
  end
end
