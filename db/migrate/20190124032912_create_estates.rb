class CreateEstates < ActiveRecord::Migration[5.2]
  def change
    create_table :estates do |t|
      t.string :type
      t.integer :estate_number
      t.string :address
      t.string :number
      t.string :estate_kind
      t.text :area
      t.string :structure
      t.string :apart_name
      t.string :apart_structure
      t.text :apart_area
      t.integer :sign
      t.string :land_kind
      t.string :land_percent
      t.text :remarks

      t.index :type
      t.timestamps
    end
  end
end
