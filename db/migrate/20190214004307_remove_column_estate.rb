class RemoveColumnEstate < ActiveRecord::Migration[5.2]
  def up
    remove_column :estates, :land_kind, :land_percent
  end

  def down
    add_column :estates, :land_kind, :string, :land_percent, :string
  end
end
