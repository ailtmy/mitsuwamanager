class CreateProjectEstates < ActiveRecord::Migration[5.2]
  def change
    create_table :project_estates do |t|
      t.references :project, foreign_key: true
      t.references :estate, foreign_key: true

      t.timestamps
    end
  end
end
