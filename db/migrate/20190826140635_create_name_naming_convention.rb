class CreateNameNamingConvention < ActiveRecord::Migration[5.2]
  def change
  	rename_column :project_modules, :description, :name 
  	rename_column :project_umbrellas, :category, :name
  	rename_column :projects, :description, :name 
  	rename_column :scrum_tasks, :task, :name
  	rename_column :trackers, :subtask_2, :description
  end
end
