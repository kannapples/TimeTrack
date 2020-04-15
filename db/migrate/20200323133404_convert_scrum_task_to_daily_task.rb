class ConvertScrumTaskToDailyTask < ActiveRecord::Migration[5.2]
  def change
  	rename_table :scrum_tasks, :daily_tasks
  	rename_column :daily_tasks, :project_module_id, :weekly_goal_id
  	# add_index :daily_tasks, :weekly_goal_id
  	# rename_index :daily_tasks, :index_scrum_tasks_on_project_module_id, :index_scrum_tasks_on_weekly_goal_id
  	rename_column :trackers, :project_module_id, :weekly_goal_id
  	rename_column :trackers, :scrum_task_id, :daily_task_id
  	# rename_index :trackers, :index_trackers_on_project_module_id, :index_trackers_on_weekly_goal_id
  	add_index :trackers, :weekly_goal_id
  	rename_index :trackers, :index_trackers_on_scrum_task_id, :index_trackers_on_daily_task_id
  end
end
