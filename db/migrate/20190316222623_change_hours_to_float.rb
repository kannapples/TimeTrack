class ChangeHoursToFloat < ActiveRecord::Migration[5.2]
  def change
  	change_column :trackers, :hours, :float
  end
end
