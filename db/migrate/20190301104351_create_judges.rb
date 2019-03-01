class CreateJudges < ActiveRecord::Migration[5.2]
  def change
    create_table :judges do |t|
      t.string :title
      t.string :category
      t.references :control, foreign_key: true
      t.datetime :datetime
      t.references :user, foreign_key: true
      t.integer :estate_id
      t.text :content
      t.text :document
      t.text :opinion
      t.text :answer
      t.string :answer_control
      t.string :answer_number
      t.string :event
      t.string :cause_date
      t.string :status

      t.timestamps
    end
  end
end
