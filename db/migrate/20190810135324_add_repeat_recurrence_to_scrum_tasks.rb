class AddRepeatRecurrenceToScrumTasks < ActiveRecord::Migration[5.2]
  def change
  	add_reference :scrum_tasks, :repeat_recurrences, index: true
  end
end
