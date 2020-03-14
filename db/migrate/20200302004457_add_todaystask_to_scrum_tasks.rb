class AddTodaystaskToScrumTasks < ActiveRecord::Migration[5.2]
  def change
  	add_column :scrum_tasks, :is_daily_task, :boolean
    add_index  :scrum_tasks, :is_daily_task 
  end
end
