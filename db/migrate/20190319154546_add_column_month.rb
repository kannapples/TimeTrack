class AddColumnMonth < ActiveRecord::Migration[5.2]
  def change
  	add_column :trackers, :month, :integer, after: :date
  end
end
