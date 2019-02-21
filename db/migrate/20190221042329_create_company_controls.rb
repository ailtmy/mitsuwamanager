class CreateCompanyControls < ActiveRecord::Migration[5.2]
  def change
    create_table :company_controls do |t|
      t.integer :company_id
      t.integer :control_id
      t.string :control_kind

      t.timestamps
    end
  end
end
