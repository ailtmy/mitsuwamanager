class CreateCosts < ActiveRecord::Migration[5.2]
  def change
    create_table :costs do |t|
      t.references :project, foreign_key: true
      t.date :date
      t.string :category
      t.string :pay_org
      t.string :pay

      t.timestamps
    end
  end
end
