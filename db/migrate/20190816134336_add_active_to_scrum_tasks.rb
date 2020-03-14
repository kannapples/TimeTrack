class AddActiveToScrumTasks < ActiveRecord::Migration[5.2]
  def change
  	remove_column :scrum_tasks, :periodicity, :string
  	add_column :scrum_tasks, :active, :boolean
  	add_column :trackers, :active, :boolean
  end
end
