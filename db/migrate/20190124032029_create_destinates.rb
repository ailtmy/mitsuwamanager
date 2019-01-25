class CreateDestinates < ActiveRecord::Migration[5.2]
  def change
    create_table :destinates do |t|
      t.references :project, foreign_key: true
      t.date :send_date
      t.string :send_addr
      t.string :send_number
      t.boolean :receive_doc

      t.timestamps
    end
  end
end
