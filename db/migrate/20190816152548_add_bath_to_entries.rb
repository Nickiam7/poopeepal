class AddBathToEntries < ActiveRecord::Migration[5.2]
  def change
    add_column :entries, :bath, :integer, default: 0
  end
end
