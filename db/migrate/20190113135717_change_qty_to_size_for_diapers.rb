class ChangeQtyToSizeForDiapers < ActiveRecord::Migration[5.2]
  def change
   rename_column :diapers, :qty, :size
  end
end
