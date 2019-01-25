class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :name, null: false
      t.datetime :application_date
      t.string :place
      t.string :status
      t.datetime :place_date
      t.boolean :tax_reduction
      t.string :tax_document
      t.boolean :loan
      t.integer :loan_price
      t.datetime :loan_agree
      t.boolean :loan_document
      t.boolean :change_name
      t.string :change_name_doc
      t.boolean :erasure
      t.boolean :erasure_confirm
      t.date :complete_date
      t.references :user
      t.boolean :report
      t.text :request_content
      t.text :remarks
      t.string :type

      t.index :type
      t.timestamps
    end
  end
end
