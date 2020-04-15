class WeeklyGoal < ApplicationRecord

	belongs_to :project
	has_many :daily_tasks

	validates_presence_of :name #name is a required field

	def active_task_num
		daily_tasks.where(:active => true).count
	end
	
end
