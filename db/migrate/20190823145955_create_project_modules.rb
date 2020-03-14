class CreateProjectModules < ActiveRecord::Migration[5.2]
  def change
    create_table :project_modules do |t|
      t.string :description
      t.date :start_date
      t.date :completion_goal_date

      t.timestamps
    end
  end
end
