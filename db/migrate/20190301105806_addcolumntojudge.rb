class Addcolumntojudge < ActiveRecord::Migration[5.2]
  def up
    add_column :judges, :project_id, :integer
  end

  def down
    remove_column :judges, :project_id
  end
end
