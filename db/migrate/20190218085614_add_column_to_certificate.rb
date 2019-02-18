class AddColumnToCertificate < ActiveRecord::Migration[5.2]
  def up
    add_column :certificates, :window, :boolean, default: false
  end

  def down
    remove_column :certificates, :window
  end
end
