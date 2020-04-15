class DailyTask < ApplicationRecord

	belongs_to :weekly_goal, optional: true
	belongs_to :project
	has_many :trackers

	def populate_ids
		if !self.project_id.nil? then
			self.project_umbrella_id ||= self.weekly_goal.project.project_umbrella_id
		elsif !self.weekly_goal.nil? then
			self.project_id ||= self.weekly_goal.project_id
			self.project_umbrella_id ||= self.weekly_goal.project.project_umbrella_id
		end
	end

	def nightly_task_processing 
			completed_tasks = @daily_tasks
			completed_tasks.delete_if { |task| task.completed == true} #limit array to only completed tasks

			completed_tasks.each do |task| 
				if task.repeat_recurrence_id == 1 
					self.class.collection
              			.update(task.id, :completed => false)
				else 
					self.class.collection
						.update(task.id, :active => false) #flag the task as inactive
				end
			end
	end

	#for email processing, loop through inactive tasks for reporting. probably delete them? 
end
