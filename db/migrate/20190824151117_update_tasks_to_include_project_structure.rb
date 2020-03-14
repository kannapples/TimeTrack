class UpdateTasksToIncludeProjectStructure < ActiveRecord::Migration[5.2]
  def change
  	add_column :scrum_tasks, :project_id, :integer
    add_index  :scrum_tasks, :project_id 

    add_column :scrum_tasks, :project_module_id, :integer
    add_index :scrum_tasks, :project_module_id
  end
end
