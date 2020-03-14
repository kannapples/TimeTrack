class DropProjectModuleProjects < ActiveRecord::Migration[5.2]
  def change
  	drop_table :project_modules_projects
  end
end
