class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.references :addressable, polymorphic: true
      t.string :zip
      t.string :address
      t.date :since_date

      t.timestamps
    end
  end
end
