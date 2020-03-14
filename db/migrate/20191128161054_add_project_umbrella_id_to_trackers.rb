class AddProjectUmbrellaIdToTrackers < ActiveRecord::Migration[5.2]
  def change
  	add_column :trackers, :project_umbrella_id, :integer
    add_index  :trackers, :project_umbrella_id 

    remove_column :trackers, :task, :string
    remove_column :trackers, :subtask_1, :string
  end
end
