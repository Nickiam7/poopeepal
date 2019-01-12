class AddFeedingNotesToFeedings < ActiveRecord::Migration[5.2]
  def change
    add_column :feedings, :feeding_notes, :text
  end
end
