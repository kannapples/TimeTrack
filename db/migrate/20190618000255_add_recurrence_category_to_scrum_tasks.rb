class AddRecurrenceCategoryToScrumTasks < ActiveRecord::Migration[5.2]
  def change
  	remove_column :scrum_tasks, :recurrence, :string
  	add_reference :scrum_tasks, :task_recurrences, index: true
  end
end
