class CreateSleeps < ActiveRecord::Migration[5.2]
  def change
    create_table :sleeps do |t|
      t.string :start_time
      t.string :end_time
      t.string :location

      t.timestamps
    end
  end
end
