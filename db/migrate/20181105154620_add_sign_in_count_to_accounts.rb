class AddSignInCountToAccounts < ActiveRecord::Migration[5.2]
  def change
    add_column :accounts, :sign_in_count, :int, default: 0, null: false
  end
end
