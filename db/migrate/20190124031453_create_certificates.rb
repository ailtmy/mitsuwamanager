class CreateCertificates < ActiveRecord::Migration[5.2]
  def change
    create_table :certificates do |t|
      t.string :cert_kind
      t.integer :number_sheet
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
