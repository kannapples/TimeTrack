class RenameModuleToWeeklyGoal < ActiveRecord::Migration[5.2]
  def change
  	rename_table :project_modules, :weekly_goals
  end
end
