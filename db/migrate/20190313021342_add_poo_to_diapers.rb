class AddPooToDiapers < ActiveRecord::Migration[5.2]
  def change
    add_column :diapers, :poo, :boolean, null: false, default: false
  end
end
