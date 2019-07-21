class AddDiaperCountToEntries < ActiveRecord::Migration[5.2]
   def change
      add_column :entries, :diaper_count, :integer, default: 0, null: false
   end
end
