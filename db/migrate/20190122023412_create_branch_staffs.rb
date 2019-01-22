class CreateBranchStaffs < ActiveRecord::Migration[5.2]
  def change
    create_table :branch_staffs do |t|
      t.references :staff
      t.references :branch
      t.string :title
      t.date :assigned_date

      t.timestamps
    end
  end
end
