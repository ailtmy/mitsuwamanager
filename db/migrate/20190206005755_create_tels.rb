class CreateTels < ActiveRecord::Migration[5.2]
  def change
    create_table :tels do |t|
      t.references :telable, polymorphic: true
      t.string :tel_number
      t.string :tel_kind

      t.timestamps
    end
  end
end
