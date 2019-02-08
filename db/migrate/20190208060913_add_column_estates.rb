class AddColumnEstates < ActiveRecord::Migration[5.2]
  def up
    add_reference :estates, :control, foreign_key: true 
  end

  def down
    remove_reference :estates, :control, foreign_key: true
  end
end
