class AddPeeToDiapers < ActiveRecord::Migration[5.2]
  def change
    add_column :diapers, :pee, :boolean, null: false, default: false
  end
end
