class AddHeightToBabies < ActiveRecord::Migration[5.2]
  def change
    add_column :babies, :height, :string
    add_column :babies, :weight, :string
  end
end
