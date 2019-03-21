class AddTextureToDiapers < ActiveRecord::Migration[5.2]
  def change
    add_column :diapers, :texture, :string
  end
end
