class ChangeColumnName < ActiveRecord::Migration[5.2]
   def change
      rename_column :entries, :diaper_count, :diapers_count
   end
end
