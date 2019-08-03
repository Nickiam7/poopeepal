class AddBabyThumbToBabies < ActiveRecord::Migration[5.2]
  def change
    add_column :babies, :baby_thumb, :string
  end
end
