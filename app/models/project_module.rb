class ProjectModule < ApplicationRecord
	belongs_to :project
	has_many :scrum_tasks
end
