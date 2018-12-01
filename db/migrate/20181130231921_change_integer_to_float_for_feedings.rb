class ChangeIntegerToFloatForFeedings < ActiveRecord::Migration[5.2]
  def change
   change_column :feedings, :amount, :float
  end
end
