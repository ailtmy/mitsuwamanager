class AddColumnToDestinate < ActiveRecord::Migration[5.2]
  def up
    add_column :destinates, :send_method, :boolean, default: false
    add_reference :destinates, :customer
  end

  def down
    remove_column :destinates, :send_method
    remove_reference :destinates, :customer
  end
end
