class AddColumnToCasefiles < ActiveRecord::Migration[5.2]
  def up
    add_column :casefiles, :kind, :string
  end

  def down
    remove_column :casefiles, :kind
  end
end
