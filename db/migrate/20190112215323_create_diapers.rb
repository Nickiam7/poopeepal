class CreateDiapers < ActiveRecord::Migration[5.2]
  def change
    create_table :diapers do |t|
      t.time :time
      t.string :qty
      t.string :color
      t.text :note
      t.references :entry, foreign_key: true

      t.timestamps
    end
  end
end
