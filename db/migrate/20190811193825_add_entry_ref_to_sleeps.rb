class AddEntryRefToSleeps < ActiveRecord::Migration[5.2]
  def change
    add_reference :sleeps, :entry, foreign_key: true
  end
end
