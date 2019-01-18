class CreateIdentifies < ActiveRecord::Migration[5.2]
  def change
    create_table :identifies do |t|
      t.references :user, foreign_key: true
      t.references :customer, foreign_key: true
      t.string :ident_method
      t.datetime :date_time
      t.string :place
      t.string :item
      t.string :photo
      t.string :number
      t.date :issuance_date
      t.date :expiration_date
      t.string :publisher
      t.date :ident_receipt
      t.boolean :original_copy
      t.date :send_date
      t.date :document_receipt
      t.text :remarks

      t.timestamps
    end
  end
end
