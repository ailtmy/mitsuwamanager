class CreateEstateUnits < ActiveRecord::Migration[5.2]
  def change
    create_table :estate_units do |t|
      t.references :estate
      t.references :unit

      t.timestamps
    end
  end
end
