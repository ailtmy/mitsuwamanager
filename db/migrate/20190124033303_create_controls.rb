class CreateControls < ActiveRecord::Migration[5.2]
  def change
    create_table :controls do |t|
      t.integer :number
      t.string :name
      t.text :remark

      t.timestamps
    end
  end
end
