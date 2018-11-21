class AddTimeZoneToAccounts < ActiveRecord::Migration[5.2]
  def change
    add_column :accounts, :time_zone, :string, default: "UTC"
  end
end
