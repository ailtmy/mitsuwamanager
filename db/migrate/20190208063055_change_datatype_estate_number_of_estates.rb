class ChangeDatatypeEstateNumberOfEstates < ActiveRecord::Migration[5.2]
  def change
    change_column :estates, :estate_number, :string
  end
end
