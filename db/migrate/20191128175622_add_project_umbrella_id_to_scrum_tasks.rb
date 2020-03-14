class AddProjectUmbrellaIdToScrumTasks < ActiveRecord::Migration[5.2]
  def change
  	add_column :scrum_tasks, :project_umbrella_id, :integer
    add_index  :scrum_tasks, :project_umbrella_id 

    remove_column :scrum_tasks, :category, :string
  end
end
