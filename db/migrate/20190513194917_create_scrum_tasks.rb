class CreateScrumTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :scrum_tasks do |t|
      t.string :periodicity
      t.string :category
      t.string :task
      t.boolean :completed?

      t.timestamps
    end
  end
end
