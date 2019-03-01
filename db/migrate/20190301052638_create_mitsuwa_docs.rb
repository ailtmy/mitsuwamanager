class CreateMitsuwaDocs < ActiveRecord::Migration[5.2]
  def change
    create_table :mitsuwa_docs do |t|
      t.string :title
      t.string :category
      t.string :kind
      t.text :content
      t.references :user, foreign_key: true
      t.date :date

      t.timestamps
    end
  end
end
