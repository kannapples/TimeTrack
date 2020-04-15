class Project < ApplicationRecord

	has_many :weekly_goals
	belongs_to :project_umbrella, optional: true
	has_many :daily_tasks
	has_many :trackers

	validates_presence_of :name #name is a required field

	#instance method to check for any associated projects
	def children?
		weekly_goals.any?
	end

	def get_children_string
		wg_array = weekly_goals.all.collect {|wg| [ wg.name ] }
		wg_string = wg_array.map(&:inspect).to_s
		return wg_string
	end

	def get_children
		wg_array = weekly_goals.all
	end
	
end
