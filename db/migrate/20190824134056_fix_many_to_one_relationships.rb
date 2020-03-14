class FixManyToOneRelationships < ActiveRecord::Migration[5.2]
  def change
  	drop_table :projects_project_modules

  	add_column :project_modules, :project_id, :integer
    add_index  :project_modules, :project_id
  end
end
