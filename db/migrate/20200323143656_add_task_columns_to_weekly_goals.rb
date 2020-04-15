class AddTaskColumnsToWeeklyGoals < ActiveRecord::Migration[5.2]
  def change
  	rename_table :task_recurrences, :repeat_recurrences
  	remove_column :weekly_goals, :start_date
  	remove_column :weekly_goals, :completion_goal_date
  	add_column :weekly_goals, :completed, :boolean
  	add_reference :weekly_goals, :repeat_recurrences, index: true
  	add_column :weekly_goals, :active, :boolean
  	add_reference :weekly_goals, :project_umbrellas, index: true
  	remove_reference :daily_tasks, :task_recurrences, index: true
  end
end
