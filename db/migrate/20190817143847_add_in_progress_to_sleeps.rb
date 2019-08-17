class AddInProgressToSleeps < ActiveRecord::Migration[5.2]
  def change
    add_column :sleeps, :in_progress, :boolean, default: false
  end
end
