class ProjectUmbrella < ApplicationRecord

	has_many :projects

	validates_presence_of :name #name is a required field

	#instance method to check for any associated projects
	def children?
		projects.any?
	end

	def get_children_string
		project_array = projects.all.collect {|p| [ p.name ] }
		project_string = project_array.map(&:inspect).to_s
		return project_string
	end

	def get_children
		project_array = projects.all
	end
end
