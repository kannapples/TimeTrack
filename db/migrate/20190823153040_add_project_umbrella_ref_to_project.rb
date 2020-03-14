class AddProjectUmbrellaRefToProject < ActiveRecord::Migration[5.2]
  def change
  	add_reference :projects, :project_umbrellas, index: true
  end
end
