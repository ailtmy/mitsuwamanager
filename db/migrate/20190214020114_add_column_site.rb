class AddColumnSite < ActiveRecord::Migration[5.2]
  def up
    add_column :sites, :sign, :integer
  end

  def down
    remove_column :sites, :sign
  end
end
