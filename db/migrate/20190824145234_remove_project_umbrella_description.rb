class RemoveProjectUmbrellaDescription < ActiveRecord::Migration[5.2]
  def change
  	remove_column :project_umbrellas, :description
  end
end
