class Project < ApplicationRecord
	has_many :project_modules
	belongs_to :project_umbrella, optional: true
	has_many :scrum_tasks
end
