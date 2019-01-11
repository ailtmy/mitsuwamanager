class CreateCasefiles < ActiveRecord::Migration[5.2]
  def change
    create_table :casefiles do |t|
      t.integer :year
      t.integer :number
      t.date :date
      t.string :event_title
      t.integer :event_number
      t.integer :count
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
