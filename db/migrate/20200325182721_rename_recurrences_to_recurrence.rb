class RenameRecurrencesToRecurrence < ActiveRecord::Migration[5.2]
  def change
  	rename_column :daily_tasks, :repeat_recurrences_id, :repeat_recurrence_id
  	rename_index :daily_tasks, :index_daily_tasks_on_repeat_recurrences_id, :index_daily_tasks_on_repeat_recurrence_id
  	rename_column :weekly_goals, :repeat_recurrences_id, :repeat_recurrence_id
  	rename_index :weekly_goals, :index_weekly_goals_on_repeat_recurrences_id, :index_weekly_goals_on_repeat_recurrence_id

  end
end
