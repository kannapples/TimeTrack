class ChangeProjectUmbrColName < ActiveRecord::Migration[5.2]
  def change
  	rename_column :weekly_goals, :project_umbrellas_id, :project_umbrella_id
  	rename_index :weekly_goals, 'index_weekly_goals_on_project_umbrellas_id', 'index_weekly_goals_on_project_umbrella_id'
  end
end
