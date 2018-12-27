class CreateFeedings < ActiveRecord::Migration[5.2]
  def change
    create_table :feedings do |t|
      t.time :start_time
      t.time :end_time
      t.integer :amount
      t.references :entry, foreign_key: true

      t.timestamps
    end
  end
end
