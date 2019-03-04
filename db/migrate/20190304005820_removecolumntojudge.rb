class Removecolumntojudge < ActiveRecord::Migration[5.2]
  def up
    remove_column :judges, :estate_id
  end

  def down
    add_column :judges, :estate_id, :integer
  end
end
