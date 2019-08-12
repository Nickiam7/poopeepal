class AddNotesToSleep < ActiveRecord::Migration[5.2]
  def change
    add_column :sleeps, :notes, :string
  end
end
