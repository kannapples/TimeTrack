class AddCompletionGoalDateToProject < ActiveRecord::Migration[5.2]
  def change
  	add_column :projects, :completion_goal_date, :date
  end
end
