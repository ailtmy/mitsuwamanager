class AddColumnAddresses < ActiveRecord::Migration[5.2]
  def up
    add_column :addresses, :address_kind, :string
    add_column :addresses, :address_closure, :boolean
  end

  def down
    remove_column :addresses, :address_kind, :string
    remove_column :addresses, :address_closure, :boolean
  end
end
