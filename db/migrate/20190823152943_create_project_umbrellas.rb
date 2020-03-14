class CreateProjectUmbrellas < ActiveRecord::Migration[5.2]
  def change
    create_table :project_umbrellas do |t|
      t.string :description
      t.string :category

      t.timestamps
    end
  end
end
