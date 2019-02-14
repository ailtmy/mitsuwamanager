class CreateApartRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :apart_rooms do |t|
      t.references :apart
      t.references :room

      t.timestamps
    end
  end
end
