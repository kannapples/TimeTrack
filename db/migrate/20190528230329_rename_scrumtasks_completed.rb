class RenameScrumtasksCompleted < ActiveRecord::Migration[5.2]
  def change
  	rename_column :scrum_tasks, :completed?, :completed
  end
end
