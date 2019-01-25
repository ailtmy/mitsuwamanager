class CreatePrices < ActiveRecord::Migration[5.2]
  def change
    create_table :prices do |t|
      t.integer :year
      t.integer :price
      t.references :estate, foreign_key: true
      t.string :price_kind
      t.text :remarks

      t.timestamps
    end
  end
end
