class ChangTimeZoneDefault < ActiveRecord::Migration[5.2]
  def change
   change_column_default(:accounts, :time_zone, nil)
  end
end
