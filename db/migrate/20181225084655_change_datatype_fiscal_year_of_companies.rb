class ChangeDatatypeFiscalYearOfCompanies < ActiveRecord::Migration[5.2]
  def change
    change_column :customers, :fiscal_year, :integer
  end
end
