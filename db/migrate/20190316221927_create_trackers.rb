class CreateTrackers < ActiveRecord::Migration[5.2]
  def change
    create_table :trackers do |t|
      t.date :date
      t.string :task
      t.string :subtask_1
      t.string :subtask_2
      t.integer :hours
      t.time :start_time
      t.time :end_time
      t.float :payment

      t.timestamps
    end
  end
end
