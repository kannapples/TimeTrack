class ChangeColumnNameForProjectUmbrellasId < ActiveRecord::Migration[5.2]
  def change
  	rename_column :projects, :project_umbrellas_id, :project_umbrella_id
  end
end
