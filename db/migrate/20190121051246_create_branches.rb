class CreateBranches < ActiveRecord::Migration[5.2]
  def change
    create_table :branches do |t|
      t.references :customer, foreign_key: true
      t.string :branch_name, null: false

      t.timestamps
    end
  end
end
