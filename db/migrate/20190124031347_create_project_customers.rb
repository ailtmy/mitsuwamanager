class CreateProjectCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :project_customers do |t|
      t.references :project, foreign_key: true
      t.references :customer, foreign_key: true
      t.string :position
      t.string :equity

      t.timestamps
    end
  end
end
