class AddSlugToBabies < ActiveRecord::Migration[5.2]
  def change
    add_column :babies, :slug, :string
    add_index :babies, :slug, unique: true
  end
end
