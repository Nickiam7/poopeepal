class CreateBabies < ActiveRecord::Migration[5.2]
  def change
    create_table :babies do |t|
      t.string :name
      t.string :gender
      t.date :dob
      t.references :account, foreign_key: true

      t.timestamps
    end
  end
end
