class AddRecurrenceToScrumTasks < ActiveRecord::Migration[5.2]
  def change
  	add_column :scrum_tasks, :recurrence, :string
  end
end
