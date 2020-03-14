class UpdateTrackersToIncludeProjectStructure < ActiveRecord::Migration[5.2]
  def change
  	add_column :trackers, :project_id, :integer
    add_index  :trackers, :project_id 

    add_column :trackers, :project_module_id, :integer
    add_index :trackers, :project_module_id

    add_column :trackers, :scrum_task_id, :integer
    add_index :trackers, :scrum_task_id
  end
end
