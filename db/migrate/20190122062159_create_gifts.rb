class CreateGifts < ActiveRecord::Migration[5.2]
  def change
    create_table :gifts do |t|
      t.references :customer, foreign_key: true
      t.string :send_receive
      t.string :gift_kind
      t.integer :gift_year
      t.string :gift_address
      t.text :gift_remark

      t.timestamps
    end
  end
end
