class CreateMistakes < ActiveRecord::Migration[5.2]
  def change
    create_table :mistakes do |t|
      t.references :user, foreign_key: true
      t.string :category
      t.integer :project_id
      t.string :title
      t.text :content
      t.date :date

      t.timestamps
    end
  end
end
