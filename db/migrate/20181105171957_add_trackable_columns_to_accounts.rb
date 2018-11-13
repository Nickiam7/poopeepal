class AddTrackableColumnsToAccounts < ActiveRecord::Migration[5.2]
  def change
   add_column :accounts, :current_sign_in_at, :datetime
   add_column :accounts, :last_sign_in_at, :datetime
   add_column :accounts, :current_sign_in_ip, :inet
   add_column :accounts, :last_sign_in_ip, :inet
  end
end
