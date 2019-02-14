class CreateSites < ActiveRecord::Migration[5.2]
  def change
    create_table :sites do |t|
      t.references :room
      t.references :land
      t.string :land_kind
      t.string :land_percent

      t.timestamps
    end
  end
end
