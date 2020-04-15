# class CreateProjectsProjectModulesJoinTable < ActiveRecord::Migration[5.2]
#   def change
#   	create_join_table :projects, :project_modules do |t|
#     	t.index :projects      # add indexes for faster querying
#     	t.index :project_module_id
#     end
#   end
# end
