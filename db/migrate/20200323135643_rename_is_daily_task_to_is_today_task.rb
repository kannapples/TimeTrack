class RenameIsDailyTaskToIsTodayTask < ActiveRecord::Migration[5.2]
  def change
  	rename_column :daily_tasks, :is_daily_task, :is_today_task
  	# rename_index :daily_tasks, :index_daily_tasks_on_is_daily_task, :index_daily_tasks_on_is_today_task
  end
end
