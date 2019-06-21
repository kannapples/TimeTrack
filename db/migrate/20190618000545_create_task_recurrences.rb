class CreateTaskRecurrences < ActiveRecord::Migration[5.2]
  def change
    create_table :task_recurrences do |t|
      t.string :name

      t.timestamps
    end
  end
end
